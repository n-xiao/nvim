-- vim.opt.fillchars = {
--     stl = "─",
--     stlnc = "─",
-- }

local colours = require("kanagawa.colors").setup().palette
local custom_fname = require("lualine.components.filename"):extend()
local highlight = require("lualine.highlight")

local default_status_colors = { saved = "#C8C093", modified = "#938056" }

function custom_fname:init(options)
    custom_fname.super.init(self, options)
    self.status_colors = {
        saved = highlight.create_component_highlight_group(
            { fg = default_status_colors.saved },
            "filename_status_saved",
            self.options
        ),
        modified = highlight.create_component_highlight_group(
            { fg = default_status_colors.modified },
            "filename_status_modified",
            self.options
        ),
    }
    if self.options.color == nil then
        self.options.color = ""
    end
end

function custom_fname:update_status()
    local data = custom_fname.super.update_status(self)
    data = highlight.component_format_highlight(
        vim.bo.modified and self.status_colors.modified or self.status_colors.saved
    ) .. data
    return data
end

local custom_mode = {
    function()
        return ""
    end,
    color = function()
        -- auto change color according to neovims mode
        -- honestly dk what the other options mean
        local mode_color = {
            n = colours.lightBlue, -- normal
            i = colours.peachRed, -- insert
            v = colours.springViolet2, -- visual
            [""] = colours.springViolet2,
            V = colours.springViolet2,
            c = colours.surimiOrange, -- cmd
            no = colours.peachRed,
            s = colours.peachRed,
            S = colours.peachRed,
            [""] = colours.peachRed,
            ic = colours.peachRed,
            R = colours.waveRed,
            Rv = colours.waveRed,
            cv = colours.lightBlue,
            ce = colours.lightBlue,
            r = colours.waveRed,
            rm = colours.waveRed,
            ["r?"] = colours.waveRed,
            ["!"] = colours.waveRed,
            t = colours.lightBlue,
        }
        return { fg = mode_color[vim.fn.mode()] }
    end,
    padding = { left = 3, right = 2 },
}

local lualine = require("lualine")

local config = {
    options = {
        icons_enabled = true,
        theme = {
            normal = { c = { fg = colours.oldWhite, bg = nil } },
            inactive = { c = { fg = colours.oldWhite, bg = nil } },
        },
        component_separators = "",
        section_separators = "",
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = true,
        refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
        },
    },
    sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
}
-- Inserts a component in lualine_c at left section
local function ins_left(component)
    table.insert(config.tabline.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
    table.insert(config.tabline.lualine_x, component)
end

ins_left(custom_mode)
ins_right(custom_fname)
ins_right("branch")
ins_right("diagnostics")
ins_right("os.date('  %I:%M %p')")

lualine.setup(config)
