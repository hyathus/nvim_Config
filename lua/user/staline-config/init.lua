
    -->              ⌬  | left   :           | right  :            | toggle:  
    require('stabline').setup {
        style='bar',
        font_active='bold,italic',
        stab_start="  %#Function#  ", stab_left = " ",
        -- bg = "#11121d",
        fg="#986fec",
        bg = "none",
        stab_bg = "none",
        -- inactive_bg="#11121d",
        inactive_bg="none",
        -- stab_end = "%#Function#%@Click@ %X  "
        -- stab_end = "%#Function#%@Click@ %X  "
    }

    require("staline").setup {
        sections = {
            left = { '  ', 'mode', ' ', 'branch', '  ⌬   ', 'lsp' },
            mid = { 'file_name', '%<' },
            right = { function()
                return vim.b.bookmark or ''
            end, '    %l/%L  :%c    ',
                function()
                    local chars = { "_", "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" }
                    local line_ratio = vim.fn.line(".") / vim.fn.line("$")
                    local index = math.ceil(line_ratio * #chars)
                    return chars[index]
                end, ' '
            },
        },
        defaults = {
            expand_null_ls = true,
            null_ls_symbol = "|",
            true_colors = true,
            line_column = " [%l/%L] :%c  ",
            branch_symbol = " ",
        }
    }
