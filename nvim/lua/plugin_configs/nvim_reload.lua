local nvim_reload_config = function()
  local reload = require('nvim-reload')
  reload.lua_reload_dirs = { NVIM_DIR .. '/' }
end

return nvim_reload_config
