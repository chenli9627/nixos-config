{ pkgs, ... }:

let
  launchScript =
    pkg:
    pkgs.writeShellScriptBin "${pkg}-scaled" ''
      export QT_FONT_DPI=144
      export LANG=zh_CN.UTF-8
      exec ${pkg} "$@"
    '';
in
{
  xdg.desktopEntries = {
    wps = {
      name = "WPS Office (scaled)";
      genericName = "Office Suite";
      exec = "${launchScript "wps"}/bin/wps-scaled %F";
      terminal = false;
      categories = [
        "Office"
        "WordProcessor"
      ];
    };
    et = {
      name = "WPS Speardsheets (scaled)";
      genericName = "Office Suite";
      exec = "${launchScript "wps"}/bin/et-scaled %F";
      terminal = false;
      categories = [
        "Office"
        "WordProcessor"
      ];
    };

    wpp = {
      name = "WPS Presentation (scaled)";
      genericName = "Presentation";
      exec = "${launchScript "wpp"}/bin/wpp-scaled %F";
      terminal = false;
      categories = [
        "Office"
        "Presentation"
      ];
    };

    wpspdf = {
      name = "WPS PDF (scaled)";
      genericName = "PDF Viewer";
      exec = "${launchScript "wpspdf"}/bin/wpspdf-scaled %F";
      terminal = false;
      categories = [
        "Office"
        "Viewer"
      ];
    };
  };
}

# {
#   xdg.desktopEntries = {
#     wps = {
#       name = "WPS Office(scaled)";
#       genericName = "doc editor";
#       exec = "export QT_FONT_DPI=144 && export LANG=zh_CN.UTF-8 && wps";
#       terminal = false;
#       categories = [
#         "Utility"
#         "Editor"
#       ];
#     };
#     wpp = {
#       name = "WPS Presentation(scaled)";
#       genericName = "doc editor";
#       exec = "export QT_FONT_DPI=144 && export LANG=zh_CN.UTF-8 && wpp";
#       terminal = false;
#       categories = [
#         "Utility"
#         "Editor"
#       ];
#     };
#     wpspdf = {
#       name = "WPS PDF(scaled)";
#       genericName = "doc editor";
#       exec = "export QT_FONT_DPI=144 && export LANG=zh_CN.UTF-8 && wpspdf";
#       terminal = false;
#       categories = [
#         "Utility"
#         "Editor"
#       ];
#     };
#   };
# }
