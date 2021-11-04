local nvim_tree_config = function()
  local tree_cb = require'nvim-tree.config'.nvim_tree_callback
  require'nvim-tree'.setup{
    view = {
      side = 'right',
      mappings = {
        list = {
          { key = "x", cb = tree_cb("close_node") },
          { key = "U", cb = tree_cb("dir_up") }
        }
      }
    }
  }
end

return nvim_tree_config
