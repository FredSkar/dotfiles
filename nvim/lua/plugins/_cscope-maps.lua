return {
  "dhananjaylatkar/cscope_maps.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim", -- optional [for picker="telescope"]
--    "ibhagwan/fzf-lua", -- optional [for picker="fzf-lua"]
--    "echasnovski/mini.pick", -- optional [for picker="mini-pick"]
--    "folke/snacks.nvim", -- optional [for picker="snacks"]
  },
  opts = {
    skip_input_promt = true,
    cscope = {
      picker = "telescope",
      project_rooter = {enable = true, change_cwd = false},
      skip_picker_for_single_result = true,
      db_build_cmd = { script = "default", args = { "-bqkvR" } },
      statusline_indicator = " Cscope db building... ",
    },
  },
}
