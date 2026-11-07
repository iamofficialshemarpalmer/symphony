return {
    { "EdenEast/nightfox.nvim" },
    {
        "LazyVim/LazyVim",
        opts = {
            -- Start with a dark theme like 'nordfox' or 'terafox'
            colorscheme = "nordfox",
        },
    },

    -- Custom Colors: Manually override the core colors to match Dragon's Shadow
    {
        "goolord/alpha-nvim", -- Or any plugin that runs after colorscheme is set
        config = function()
            -- Set background and foreground colors explicitly
            vim.cmd("highlight Normal guibg=#180D15 guifg=#EBE5D6")
            vim.cmd("highlight EndOfBuffer guibg=#180D15 guifg=#180D15")
        end,
    }
}