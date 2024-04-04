--[[
-- An attempt to create flake specific nvim plugins
-- When the flake starts this will be symlinked into
-- the neovim config directory and neovim will
-- load it if it exists
--]]

local plugins = {
    {
        'mrcjkb/rustaceanvim',
        version = '^4', -- Recommended
        ft = { 'rust' },
    }
}

return plugins
