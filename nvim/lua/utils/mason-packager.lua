local package = require('mason-core.package')
local registry = require('mason-registry')

-- NOTE:
-- This util is very basic, it a server_name provided via ensure_installed
-- exists, it tries to install it and thats it. It doesnt check for updates yet,
-- or have a way to remove them. Currently, updates and deletes can be done in
-- the Mason UI.
-- TODO: Check ensure_installed against all packages installed, ignore packages
-- of type Compiler, Runtime, or LSP. This diff should tell us whats installed
-- but not listed, and then we can call pkg:uninstall()
-- TODO: If we want automatic updates, use something like the following
-- install_servers would be the code in the for do, just extract it
-- if pkg:is_installed() then
--   if version ~= nil then
--     pkg:get_installed_version(function(ok, current_version))
--       if ok and current_version ~= version then
--         install_servers
--       end
--     end
--   end
-- else
--   install_servers
-- end
-- TODO: If we want a command to trigger the updates, add a new function
-- and do the following
-- vim.api.nvim_create_user_command('MasonUpdatePackages', function() ... end, {*opts})

local M = {}

---@class PackagerSettings
local DEFAULT_SETTINGS = {
  ensure_installed = {}
}

---@param msg string
---@param level string?
local notify = vim.schedule_wrap(function(msg, level)
  level = level or vim.log.levels.INFO
  vim.notify(msg, level, { title = "utils.mason-packager.lua" })
end)

---@param options PackagerSettings
function M.setup(options)
  local opts = vim.tbl_deep_extend('force', DEFAULT_SETTINGS, options)

  -- For every package passed in, lets install it
  for _, name in ipairs(opts.ensure_installed) do
    local pkg_name, version = package.Parse(name)
    local ok, pkg = pcall(registry.get_package, pkg_name)

    notify(('[mason-packages] installing %s'):format(pkg_name))
    if ok and not pkg:is_installed() then
      notify(('[mason-packages] installing %s'):format(pkg_name))
      pkg:install({ version = version }):once('closed', vim.schedule_wrap(function()
        if pkg:is_installed() then
          notify(('[mason-packages] %s was installed'):format(pkg_name))
        else
          notify(('[mason-packages] failed to install %s'):format(pkg_name), vim.log.levels.ERROR)
        end
      end))
    end
  end
end

return M
