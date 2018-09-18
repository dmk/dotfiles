local awful = require("awful")
awful.util.spawn("/home/dkoval/.xinitrc")

require("awful.autofocus")

--
local gears = require("gears")

-- widgets
local wibox = require("wibox")

-- notifications
local naughty = require("naughty")

-- theming
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi

-- for debugging
-- local pp = require('pl.pretty').dump

local global_keys = require('rc.global_keys')
local rules = require('rc.rules')

local taskbar = require('widgets.tasklist')

-- {{{ Notifications config
naughty.config.padding = dpi(8)
naughty.config.spacing = dpi(12)

preset = {
  timeout  = 5,
  position = 'bottom_right',
}

naughty.config.presets.normal = preset
-- }}}

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
  naughty.notify({
    preset = naughty.config.presets.critical,
    title = "Oops, there were errors during startup!",
    text = awesome.startup_errors
  })
end

-- Handle runtime errors after startup
do
  local in_error = false
  awesome.connect_signal("debug::error", function (err)
    -- Make sure we don't go into an endless error loop
    if in_error then return end
    in_error = true
    naughty.notify({
      preset = naughty.config.presets.critical,
      title  = "Oops, an error happened!",
      text   = err
    })
    in_error = false
  end)
end
-- }}}

-- {{{ Variable definitions
beautiful.init(gears.filesystem.get_configuration_dir() .. "theme/theme.lua")

-- Set your default apps here
terminal = "terminator"
browser = "google-chrome-stable"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor

modkey = "Mod4"

mykeyboardlayout = awful.widget.keyboardlayout()

local taglist_buttons = gears.table.join(
  awful.button({ }, 1, function(t) t:view_only() end),
  awful.button({ modkey }, 1, function(t)
    if client.focus then
      client.focus:move_to_tag(t)
    end
  end)
)

local tasklist_buttons = gears.table.join(
  awful.button({ }, 1, function (c)
    if c == client.focus then
      c.minimized = true
    else
      -- Without this, the following
      -- :isvisible() makes no sense
      c.minimized = false
      if not c:isvisible() and c.first_tag then
        c.first_tag:view_only()
      end
      -- This will also un-minimize
      -- the client, if needed
      client.focus = c
      c:raise()
    end
  end)
)

awful.screen.connect_for_each_screen(function(scr)
  gears.wallpaper.centered(gears.filesystem.get_configuration_dir() .. "theme/images/wallpaper.png", scr)

  awful.tag(
    { " 1 ", " 2 ", " 3 ", " 4 ", " 5 " },
    scr,
    awful.layout.suit.tile
  )

  scr.mypromptbox = awful.widget.prompt()

  scr.mytextclock = wibox.widget.textclock("   %a %I:%M    ")

  scr.mytaglist = awful.widget.taglist(
    scr,
    awful.widget.taglist.filter.all,
    taglist_buttons
  )

  scr.mytasklist = taskbar(
    scr,
    taskbar.filter.currenttags,
    tasklist_buttons,
    {},
    nil,
    wibox.widget {
      layout = wibox.layout.flex.horizontal
    }
  )

  scr.mytasklist:set_max_widget_size(dpi(300))

  scr.menu_button = wibox.widget {
    layout = wibox.container.margin,
    top = dpi(3), right = dpi(20), bottom = dpi(3), left = dpi(20),
    wibox.widget.imagebox(beautiful.awesome_icon, true),
  }

  scr.menu_button:buttons(
    gears.table.join(
      scr.menu_button:buttons(),
      awful.button({}, 1,
        function ()
          scr.menu_button.top = dpi(4)
          scr.menu_button.right = dpi(21)
          scr.menu_button.bottom = dpi(4)
          scr.menu_button.left = dpi(21)
        end,
        function ()
          scr.menu_button.top = dpi(3)
          scr.menu_button.right = dpi(20)
          scr.menu_button.bottom = dpi(3)
          scr.menu_button.left = dpi(20)
        end
      )
    )
  )

  scr.mywibox = awful.wibar({
    position = "top",
    height = dpi(32),
    screen = scr,
    cursor = "hand2"
  })

  scr.mywibox:setup({
    layout = wibox.layout.align.horizontal,
    { -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      spacing = dpi(5),
      scr.menu_button,
    },
    scr.mytasklist,
    {
      layout = wibox.layout.fixed.horizontal,
      scr.mypromptbox,
      scr.mytaglist,
      {
        widget = wibox.container.margin,
        top = dpi(0), bottom = dpi(0), left = dpi(15), right = dpi(5),
        wibox.widget.systray(),
      },
      mykeyboardlayout,
      scr.mytextclock,
    }
  })
end)

root.keys(global_keys)

-- awful.rules
awful.rules.rules = rules

-- {{{ Signals
-- Signal function to execute when a new client appears.
local set_on_maximized = function(cl)
  if not (cl.class == "st-256color" or cl.class == "Emacs") then
    if cl.maximized then
      awful.titlebar.hide(cl)
      cl.shape = gears.shape.rectangle
    else
      awful.titlebar.show(cl)
      cl.shape = function(cr, h, w)
        gears.shape.partially_rounded_rect(cr, h, w, true, true, false, false, 5)
      end
    end
  end
end

client.connect_signal("manage", function (c, startup)
  set_on_maximized(c)

  -- Enable sloppy focus
  c:connect_signal("mouse::enter", function(c)
    if c.focusable then
      client.focus = c
    end
  end)

  c:connect_signal("property::maximized", set_on_maximized)
end)

client.connect_signal("request::titlebars", function(c)
  -- buttons for the titlebar
  local buttons = gears.table.join(
    awful.button({ }, 1, function()
      client.focus = c
      c:raise()
      awful.mouse.client.move(c)
    end),
    awful.button({ }, 3, function()
      client.focus = c
      c:raise()
      awful.mouse.client.resize(c)
    end)
  )

  -- Setup titlebar
  awful.titlebar(c):setup({
    widget = wibox.container.margin,
    left = 6, top = 6, right = 6, bottom = 5,
    {
      layout = wibox.layout.align.horizontal,
      {
        awful.titlebar.widget.iconwidget(c),
        layout = wibox.layout.flex.horizontal,
        buttons = buttons,
      },
      { -- Middle
        { -- Title
          align  = "center",
          widget = awful.titlebar.widget.titlewidget(c)
        },
        buttons = buttons,
        layout  = wibox.layout.flex.horizontal,
      },
      { -- Left
        layout = wibox.layout.fixed.horizontal,
        awful.titlebar.widget.maximizedbutton(c),
        awful.titlebar.widget.minimizebutton(c),
        awful.titlebar.widget.closebutton(c),
      },
    }
  })
end)
-- }}}
