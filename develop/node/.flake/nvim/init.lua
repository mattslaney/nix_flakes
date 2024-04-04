--[[
--Flake specific nvim init file
--This should be symlinked to ~/.config/nvim/flake/init.lua
--inside the shellHook of the flake.nix
--]]

-- Add flake specific init lua here...
vim.api.nvim_set_hl(0, "Normal", { bg = "#001400" })
