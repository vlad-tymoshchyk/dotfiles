local telescope_config = function()
  require('telescope').setup({
    defaults = {
      mappings = {
        i = {
          ["<esc>"] = require('telescope.actions').close,
        },
      },
      layout_config = {
        horizontal = {
          prompt_position = "bottom"
        }
      }
    },
  })
end

return telescope_config
