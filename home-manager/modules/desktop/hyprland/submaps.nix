{flakePath, ...}: let
  rofiPath = "${flakePath}/home-manager/modules/desktop/rofi";
in {
  wayland.windowManager.hyprland = {
    extraConfig = ''
      bind = $mainMod, D, submap, apps

      submap = apps

      bind = , b, exec, uwsm app -- $browser
      bind = , b, submap, reset

      bind = , e, exec, uwsm app -- thunar
      bind = , e, submap, reset

      bind = , m, exec, uwsm app -- $terminal -e termusic
      bind = , m, submap, reset

      bind = , o, exec, uwsm app -- obsidian
      bind = , o, submap, reset

      bind = , t, exec, uwsm app -- AyuGram
      bind = , t, submap, reset

      bind = , z, exec, uwsm app -- $editor
      bind = , z, submap, reset

      bind = , escape, submap, reset
      bind = , return, submap, reset

      submap = reset


      bind = $mainMod, R, submap, menu

      submap = menu

      bind = , r, exec, uwsm app -- $menu run -show-icons
      bind = , r, submap, reset

      bind = , d, exec, uwsm app -- $menu drun -show-icons
      bind = , d, submap, reset

      bind = , w, exec, uwsm app -- $menu window -show-icons
      bind = , w, submap, reset

      bind = , s, exec, uwsm app -- $menu ssh
      bind = , s, submap, reset

      bind = , c, exec, uwsm app -- $menu calc
      bind = , c, submap, reset

      bind = , e, exec, uwsm app -- $menu emoji
      bind = , e, submap, reset

      bind = , p, exec, uwsm app -- $menu p -modi p:rofi-power-menu -theme ${rofiPath}/powermenu.rasi
      bind = , p, submap, reset

      bind = , escape, submap, reset
      bind = , return, submap, reset

      submap = reset
    '';
  };
}
