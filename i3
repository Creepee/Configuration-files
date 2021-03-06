# Should you change your keyboard layout some time, delete this file and re-run i3-config-wizard(1).

# i3 config file (v4)

# Please see http://i3wm.org/docs/userguide.html for a complete reference!

set $mod Mod4

# Font for window titles. Will also be used by the bar unless a different font is used in the bar {} block below.
font pango:Ubuntu Mono Regular 20

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# start a terminal
bindsym $mod+Return exec i3-sensible-terminal

# start rofi (a program launcher)
bindsym $mod+d exec rofi -show run -bw 5 -font "Ubuntu Mono Regular 15" -opacity "85" -eh 2 -line-margin 5 -separator-style none -hide-scrollbar -lines 5 -width 25

# change focus
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

# move focused window
bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right

# split in horizontal orientation
bindsym $mod+o split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child

# switch to workspace
bindsym $mod+1 workspace 1
bindsym $mod+2 workspace 2
bindsym $mod+3 workspace 3
bindsym $mod+4 workspace 4
bindsym $mod+5 workspace 5
bindsym $mod+6 workspace 6
bindsym $mod+7 workspace 7
bindsym $mod+8 workspace 8
bindsym $mod+9 workspace 9
bindsym $mod+0 workspace 10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace 1
bindsym $mod+Shift+2 move container to workspace 2
bindsym $mod+Shift+3 move container to workspace 3
bindsym $mod+Shift+4 move container to workspace 4
bindsym $mod+Shift+5 move container to workspace 5
bindsym $mod+Shift+6 move container to workspace 6
bindsym $mod+Shift+7 move container to workspace 7
bindsym $mod+Shift+8 move container to workspace 8
bindsym $mod+Shift+9 move container to workspace 9
bindsym $mod+Shift+0 move container to workspace 10

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym h resize shrink width 10 px or 10 ppt
        bindsym k resize grow height 10 px or 10 ppt
        bindsym j resize shrink height 10 px or 10 ppt
        bindsym l resize grow width 10 px or 10 ppt
        
        # back to normal: Enter or Escape
        bindsym Return mode "default"
        bindsym Escape mode "default"
}

bindsym $mod+r mode "resize"

hide_edge_borders both

set $base00 #1f222d
set $base01 #ffffff
set $base02 #adadad
set $base03 #2f343f
set $base07 #ffffff

# Window colors
#                       border  background text
client.focused          $base00 $base00    $base01
client.focused_inactive $base03 $base03    $base02
client.unfocused        $base03 $base03    $base02
client.urgent           $base00 $base00    $base01

# Start i3bar to display a workspace bar (plus the system information conky finds out, if available)
bar {
    status_command $HOME/bin/conky-i3bar
    position top
    colors {
        background $base03
    }
    font pango:Ubuntu Mono Regular 15
}

bindsym $mod+n exec i3lock -c "000000"

exec_always xrandr --output DVI-I-1 --off --output DVI-I-0 --off --output HDMI-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-5 --off --output DP-4 --off --output DP-3 --off --output DP-2 --off --output DP-1 --off --output DP-0 --off

exec_always compton
