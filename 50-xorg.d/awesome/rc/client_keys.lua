local awful = require("awful")

local modkey = "Mod4"

local client_keys = awful.util.table.join(
  awful.key({ modkey }, "f", function (c)
    c.fullscreen = not c.fullscreen
    c:raise()
  end),

  awful.key({ modkey }, "m", function (c)
    m = not c.maximized
    c.maximized = m
    c.maximized_horizontal = m
    c.maximized_vertical = m
  end),

  awful.key({ modkey }, "q", function (c) c:kill() end),

  awful.key({ modkey }, "n", function (c) c.minimized = true end)
)

return client_keys
