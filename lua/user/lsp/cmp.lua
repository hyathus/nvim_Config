local luasnip = require "luasnip"
local cmp = require "cmp"
local lspkind = require 'lspkind'

luasnip.config.set_config {
    history = false,
    updateevents = "TextChanged,TextChangedI",
}

require("luasnip/loaders/from_vscode").lazy_load()
lspkind.init()
cmp.setup {
    completion = { completeopt = "menu,menuone,noinsert", keyword_length = 1 },
    experimental = { native_menu = false, ghost_text = false },
    formatting = {
        format = lspkind.cmp_format({
            with_text = true
        })
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
        mapping = {
        ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        ["<C-e>"] = cmp.mapping { i = cmp.mapping.close(), c = cmp.mapping.close() },
        ["<CR>"] = cmp.mapping {
            i = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false },
            c = function(fallback)
                if cmp.visible() then
                    cmp.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false }
                else
                    fallback()
                end
            end,
        },
    },
    sources = {
         {
            name = 'nvim_lsp',
            priority = 100,
            group_index = 1,
        },
        {
            name = 'nvim_lua',
            priority = 100,
            group_index = 1,
        },
        {
            name = 'luasnip',
            priority = 90,
            group_index = 1,
        },
        {
            name = 'buffer',
            priority = 80,
            autocomplete = false,
            group_index = 3,
        },
        {
            name = 'path',
            priority = 80,
            group_index = 3,
        },
        {
            name = 'treesitter',
            priority = 50,
            group_index = 3,
        },
        {
            name = 'calc',
            priority = 50,
            group_index = 3,
        },
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        },
    }
}

-- Use buffer source for `/`
cmp.setup.cmdline("/", {
    sources = {
        { name = "buffer" },
    },
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(":", {
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
})

local cmp_autopairs = require "nvim-autopairs.completion.cmp"
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
