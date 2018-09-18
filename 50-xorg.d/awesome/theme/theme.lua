local gears = require("gears")

local dpi = require("beautiful.xresources").apply_dpi
local themes_path = gears.filesystem.get_configuration_dir() .. "theme/"

-- {{{ Main
local theme = {}
theme.wallpaper = themes_path .. "images/wallpaper.png"
-- }}}

-- {{{ Styles
theme.font = "Noto Sans Medium 10"

-- {{{ Colors
theme.fg_normal  = "#E3E3E3"
theme.fg_focus   = "#E3E3E3"
theme.fg_urgent  = "#CC9393"
theme.bg_normal  = "#2A2A2AAA"
theme.bg_focus   = "#2D60E8AA"
theme.bg_urgent  = "#3F3F3FAA"
theme.bg_systray = "#2A2A2AAA"
-- }}}

-- {{{ Borders
theme.useless_gap   = dpi(7)
theme.border_width  = dpi(1)
theme.border_normal = "#3F3F3F"
theme.border_focus  = "#404040AA"
theme.border_marked = "#2A2A2AAA"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_normal = "#404040AA"
theme.titlebar_bg_focus  = "#2A2A2AAA"
theme.titlebar_fg_normal = theme.fg_normal
theme.titlebar_fg_focus  = theme.fg_normal

theme.titlebar_maximized_button_normal             = themes_path .. "images/maximize.png"
theme.titlebar_maximized_button_focus              = themes_path .. "images/maximize.png"
theme.titlebar_maximized_button_focus_active       = themes_path .. "images/maximize.png"
theme.titlebar_maximized_button_focus_active_hover = themes_path .. "images/maximize.png"
theme.titlebar_maximized_button_focus_active_press = themes_path .. "images/maximize.png"

theme.titlebar_close_button_normal             = themes_path .. "images/close.png"
theme.titlebar_close_button_focus              = themes_path .. "images/close.png"
theme.titlebar_close_button_focus_active       = themes_path .. "images/close.png"
theme.titlebar_close_button_focus_active_hover = themes_path .. "images/close.png"
theme.titlebar_close_button_focus_active_press = themes_path .. "images/close.png"

theme.titlebar_minimize_button_normal             = themes_path .. "images/minimize.png"
theme.titlebar_minimize_button_focus              = themes_path .. "images/minimize.png"
theme.titlebar_minimize_button_focus_active       = themes_path .. "images/minimize.png"
theme.titlebar_minimize_button_focus_active_hover = themes_path .. "images/minimize.png"
theme.titlebar_minimize_button_focus_active_press = themes_path .. "images/minimize.png"
-- }}}

-- {{{ Taglist
theme.taglist_font = "FuraCode Nerd Font Regular 12"
theme.taglist_bg_empty = "#929AAFAA"
theme.taglist_bg_occupied = "#929AAFAA"
-- }}}

-- {{{ Task list
theme.tasklist_plain_task_name = true
theme.tasklist_bg_focus  = "#2D60E8AA"
theme.tasklist_bg_normal = "#929AAFAA"
-- theme.tasklist_disable_task_name = true
-- }}}

-- {{{ Notifications
theme.notification_font = "FuraCode Nerd Font Regular 8"
theme.notification_bg = "#F7F7F7CC"
theme.notification_fg = "#2A2A2A"
theme.notification_border_color = "#232323AA"
theme.notification_width = dpi(375)
theme.notification_height = dpi(90)
theme.notification_margin = dpi(10)
theme.notification_opacity = 0.85

theme.notification_shape = function(cr, w, h)
  gears.shape.rounded_rect(cr, w, h, dpi(5))
end
-- }}}

-- {{{ Taglist
theme.taglist_squares_sel   = themes_path .. "images/taglist/squarefz.png"
theme.taglist_squares_unsel = themes_path .. "images/taglist/squarez.png"
theme.taglist_squares_resize = false
-- }}}

-- {{{ Misc
theme.awesome_icon = themes_path .. "images/menu-icon.png"
-- }}}

return theme
