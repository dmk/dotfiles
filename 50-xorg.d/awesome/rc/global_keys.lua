local awful = require("awful")

local start = function (cmd)
  return function () awful.util.spawn(cmd) end
end

local start_or_raise = function (cmd, cls)
  return function ()
    awful.client.run_or_raise(cmd, function (c)
      return awful.rules.match(c, { class = (cls or cmd) })
    end)
  end
end

local modkey = "Mod4"
local lang = 1

-- {{{ Global key bindings
local global_keys = awful.util.table.join(
  awful.key({ modkey }, "Left",  awful.tag.viewprev),
  awful.key({ modkey }, "Right", awful.tag.viewnext),

  awful.key({ modkey }, "Up",   function () awful.client.focus.byidx( 1) end),
  awful.key({ modkey }, "Down", function () awful.client.focus.byidx(-1) end),

  awful.key({ modkey          }, "Tab", function () awful.client.next( 1):raise() end),
  awful.key({ modkey, "Shift" }, "Tab", function () awful.client.next(-1):raise() end),

  awful.key({ modkey }, ",", function () awful.screen.focus_relative(1)  end),
  awful.key({ modkey }, ".", function () awful.screen.focus_relative(-1) end),

  -- {{{ Standard programs

  awful.key(
    { modkey, }, "e",
    start("emacs"),
    { group = "applications", description = "Open Emacs" }
  ),
  awful.key(
    { modkey, "Control" }, "f",
    start("firefox"),
    { group = "applications", description = "Open Firefox" }
  ),

  awful.key(
    { modkey, }, "Return",
    start("st"),
    { group = "applications", description = "Open terminal" }
  ),

  awful.key(
    { modkey, }, "t",
    start_or_raise("telegram-desktop"),
    { group = "applications", description = "Open Telegram" }
  ),

  awful.key(
    { modkey, }, "s",
    start_or_raise("slack"),
    { group = "applications", description = "Open Slack" }
  ),
  -- }}}

  awful.key({ modkey  }, "l", start("slock")),

  awful.key(
    { modkey, "Control" }, "s",
    start("screengrab"),
    { description = "Make a screenshot", group = "tools" }
  ),

  -- TODO: refactor
  awful.key({ modkey }, "space", function ()
    lang = lang + 1
    if lang == 1 then
      os.execute('setxkbmap -layout "ua" -option ""')
    elseif lang == 2 then
      os.execute('setxkbmap -layout "ru" -option ""')
    elseif lang == 3 then
      os.execute('setxkbmap -layout "us" -option ""')
      lang = 0
    end
  end),

  -- {{{ Awesome tasks
  awful.key({ modkey, "Control" }, "r", awesome.restart),
  awful.key({ modkey, "Shift"   }, "q", awesome.quit),
  -- }}}

  -- Command prompt
  awful.key({ modkey }, "r", function () awful.screen.focused().mypromptbox:run() end),

  -- Media keys
  awful.key({}, "XF86AudioLowerVolume", start("amixer -q sset Master 5%-")),
  awful.key({}, "XF86AudioRaiseVolume", start("amixer -q sset Master 5%+")),
  awful.key({}, "XF86AudioMute", start("amixer set Master 1+ toggle")),
  awful.key({}, "XF86AudioPlay", start("playerctl play-pause")),
  awful.key({}, "XF86AudioNext", start("playerctl next")),
  awful.key({}, "XF86AudioPrev", start("playerctl previous")),

  awful.key({ modkey, "Control" }, "Return", function ()
    awful.prompt.run {
      prompt = "<b>Enter project name:</b> ",
      textbox = mouse.screen.mypromptbox.widget,
      -- history_path = nil,

      hooks = {
        {
          {}, 'Return', function (txt)
            t = awful.tag.add("  " .. txt .. "  ", {
              layout = awful.layout.suit.tile,
              screen = scr,
              selected = true,
            })

            t:viewonly()

            -- TODO
            -- awful.util.spawn("st -t [editor]" ..  ..)
          end
        }
      }
    }
  end)
)

-- Bind keys from 1 to 5 to tags.
for i = 1, 9 do
  global_keys = awful.util.table.join(
    global_keys,

    -- View tag only.
    awful.key({ modkey }, "#" .. i + 9, function ()
      local t = awful.screen.focused().tags[i]
      if t then
        awful.tag.viewonly(t)
      end
    end),

    -- Move client to tag.
    awful.key({ modkey, "Shift" }, "#" .. i + 9, function ()
      local t = awful.screen.focused().tags[i]

      if client.focus and t then
        awful.tag.viewonly(t)
        awful.client.movetotag(awful.screen.focused().tags[i])
      end
    end)
  )
end

return global_keys
