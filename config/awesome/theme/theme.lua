local dpi = require("beautiful.xresources").apply_dpi
local themes_path = "/home/dkoval/labs/desktop/awwie.tmp/config/awesome/theme/"

-- {{{ Main
local theme = {}
theme.wallpaper = themes_path .. "images/wallpaper.png"
-- }}}

-- {{{ Styles
theme.font = "Roboto 8"

-- {{{ Colors
theme.fg_normal  = "#DCDCCC"
theme.fg_focus   = "#F0DFAF"
theme.fg_urgent  = "#CC9393"
theme.bg_normal  = "#33333390"
theme.bg_focus   = "#70b4a980"
theme.bg_urgent  = "#3F3F3F80"
theme.bg_systray = theme.bg_normal
-- }}}

-- {{{ Borders
theme.useless_gap   = dpi(0)
theme.border_width  = dpi(5)
theme.border_normal = "#4e4e4e"
theme.border_focus  = theme.border_normal
theme.border_marked = theme.border_normal
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#3F3F3F70"
theme.titlebar_bg_normal = "#3F3F3F70"
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#CC9393"
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
theme.menu_height = dpi(20)
theme.menu_font = "Roboto 13"
theme.menu_width  = dpi(300)
theme.menu_border_width = dpi(1)
theme.menu_useless_gap = dpi(0)
theme.menu_fg_normal = "#333333"
theme.menu_fg_focus  = "#eeeeee"
theme.menu_bg_normal = "#fdfdfd80"
theme.menu_bg_focus  = "#1A78D0"
-- }}}

-- {{{ Taglist
theme.taglist_squares_sel   = themes_path .. "images/taglist/squarefz.png"
theme.taglist_squares_unsel = themes_path .. "images/taglist/squarez.png"
theme.taglist_squares_resize = "true"
-- }}}
--

-- {{{ Misc
theme.awesome_icon = themes_path .. "images/awesome-icon.png"
-- }}}

return theme
