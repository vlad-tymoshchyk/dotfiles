local u = R'utils'

local lualine_config = function()
  require'lualine'.setup{
    options = {
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'diff', { 'diagnostics', sources = {'nvim_diagnostic'}}},
      lualine_c = {'filename'},
      lualine_x = {'filetype'},
      lualine_y = {'%3p%% (%l/%L)'},
      lualine_z = {'location'},
    },
    tabline = {
      lualine_a = {{'tabs', mode = 1 }},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {u.getFileRelativePath},
      lualine_z = {{ 'branch', shorting_target=112 }}
    }
  }
end

return lualine_config
