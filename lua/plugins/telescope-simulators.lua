return {
  {
    "dimaportenko/telescope-simulators.nvim",
    config = function()
      require("simulators").setup({
        android_emulator = false,
        ios_simulator = true,
      })
    end,
  },
}
