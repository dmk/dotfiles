local awful = require("awful")
local gears = require("gears")

local dpi = require("beautiful.xresources").apply_dpi

-- Uncomment for debugg
-- local pp = require('pl.pretty').dump
-- local naughty = require("naughty") -- Notifications

local ck = require("rc.client_keys")

local rules = {

  -- Defaults
  {
    rule = {},
    properties = {
      size_hints_honor = false,
      honor_padding = false,
      honor_workarea = true,

      keys      = ck,
      focus     = awful.client.focus.filter,
    }
  },

  {
    rule = {},
    except = { class = "st" },

    properties = {
      floating = true,
      raise = true,
      titlebars_enabled = true,

      size_hints_honor = true,
      honor_padding = true,
      honor_workarea = true,

      callback = function (c)
        local p = awful.placement.under_mouse + awful.placement.no_offscreen
        c:geometry(p(c))
      end
    },
  },

  {
    rule = { class = "slack" },

    properties = {
      screen = screen.primary.index,
      tag = ' default '
    },
  },


  -- Some dialogs/widgets
  -- {
    -- rules_any = {
      -- class = {
        -- "sun-awt-X11-XDialogPeer",
      -- },
      -- role = {
        -- "GtkFileChooserDialog",
      -- },
      -- type = {
        -- "dialog",
      -- },
      -- name = {
        -- "Open File",
        -- "Open Folder",
      -- }
    -- },
    -- properties = {
      -- placement = awful.placement.centered,
    -- },
  -- },

  -- Browsers
  {
    rule_any = {
      class = { "Firefox" },
      instance = { "firefox-developer-edition" }
    },
    except_any = { role = "GtkFileChooserDialog" },
    properties = {
      floating = false,
      titlebars_enabled = false,
      maximized = true,
      screen = 1,
    },
  },

  -- GTK widgets
  {
    rule = { role = "GtkFileChooserDialog" },
    properties = {
      floating = true,
      titlebars_enabled = true,
      maximized = false,
      height = dpi(500),
      width = dpi(700),
    },

    callback = function (c)
      local p = awful.placement.under_mouse + awful.placement.no_offscreen
      c.geometry(p(c))
    end
  },

  {
    rule_any = { class = { "st", "Emacs" } },
    properties = {
      floating = false,
      titlebars_enabled = false,

      size_hints_honor = false,
      honor_padding    = false,
      honor_workarea   = false,

      screen = 2
    },
    callback = function (c)
      c.shape = function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, dpi(10))
      end
    end
  },

  {
    rule_any = { class = { "Emacs" } },
    properties = {
      tag = " 1 "
    }
  }
}

return rules
