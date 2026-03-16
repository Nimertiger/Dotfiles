return {


  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local config = require("nvim-treesitter")

    config.setup({
     
      ensure_installed = {
      "lua",
      "javascript", 
      "cpp", "bash",
      "python", "typescirpt"},
     
      highlight = {
        enable = true
      }, 
     
      indent = {
        enable = true
      },
      
      autopairs = {
        enable = true,
      },



    })
  end

}
