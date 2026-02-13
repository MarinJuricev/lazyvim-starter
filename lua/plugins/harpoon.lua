return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  keys = {
    {
      "<leader>ha",
      function()
        require("harpoon"):list():add()
      end,
      desc = "Harpoon add file",
    },
    {
      "<leader>he",
      function()
        require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
      end,
      desc = "Harpoon toggle menu",
    },
    {
      "<leader>h2",
      function()
        require("harpoon"):list():select(1)
      end,
      desc = "Harpoon select 1",
    },
    {
      "<leader>h3",
      function()
        require("harpoon"):list():select(2)
      end,
      desc = "Harpoon select 2",
    },
    {
      "<leader>h4",
      function()
        require("harpoon"):list():select(3)
      end,
      desc = "Harpoon select 3",
    },
    {
      "<leader>h5",
      function()
        require("harpoon"):list():select(4)
      end,
      desc = "Harpoon select 4",
    },
    {
      "<leader>hp",
      function()
        require("harpoon"):list():prev()
      end,
      desc = "Harpoon previous",
    },
    {
      "<leader>hn",
      function()
        require("harpoon"):list():next()
      end,
      desc = "Harpoon next",
    },
  },
  dependencies = { "nvim-lua/plenary.nvim" },
}
