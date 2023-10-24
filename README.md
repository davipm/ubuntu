# Ubuntu configuration file

my personal configuration files

## Additional Programs:

### Webstorm 2023.2.2:
https://www.jetbrains.com/pt-br/webstorm/ <br/>
* Font: JetBrains Mono | 17px | L.H 1.1 <br>

### Responsively:
https://responsively.app/

### Bitwarden
https://bitwarden.com/

## Run install script

``sudo bash install.sh``

## Additional Websites
- https://extensions.gnome.org/
- https://linuxhint.com/best_gnome_extensions/
- https://itsfoss.com/essential-linux-applications/
- https://itsfoss.com/improve-privacy/
- https://iriun.com/
- https://protonvpn.com/
- https://proton.me/pt-br/mail
- https://www.morgen.so/
- https://github.com/oguzhaninan/Stacer?ref=itsfoss.com

## Additional Extensions
- https://extensions.gnome.org/extension/750/openweather/
- https://extensions.gnome.org/extension/841/freon/
- https://extensions.gnome.org/extension/1460/vitals/
- https://extensions.gnome.org/extension/1465/desktop-icons/
- https://extensions.gnome.org/extension/945/cpu-power-manager/
- https://extensions.gnome.org/extension/3193/blur-my-shell/
- https://extensions.gnome.org/extension/307/dash-to-dock/
- https://extensions.gnome.org/extension/1319/gsconnect/

## Cursor
To install more cursors on your Linux system, just put the source folders on “.icons” for the current user, or “/user/share/icons” for all users. Are you a beginner? Then, it’s suggested to put the themes into .icons under your user’s home directory.
Please Note: It’s a hidden folder. So, open “Files” from the Nautilus file manager. Then, press Ctrl+H to show or hide them.
- https://www.gnome-look.org/p/1356095

## Keyboard ABNT Configuration

```
vim  /usr/share/X11/xkb/symbols/br

partial alphanumeric_keys
xkb_symbols "nodeadkeyscustom" {

    include "br(abnt2)"
    name[Group1]="Portuguese (Brazil, no dead keys custom)";

    key <AE06> { [            6,      diaeresis,       notsign,         notsign ] };
    key <AD11> { [        grave,     apostrophe                                 ] };
    key <AC10> { [     ccedilla,       Ccedilla,         acute,     doubleacute ] };
    key <AC11> { [   asciitilde,    asciicircum                                 ] };
    key <AB10> { [    semicolon,          colon, dead_belowdot,        abovedot ] };
};

vim /usr/share/X11/xkb/rules/evdev.xml

<variant>
  <configItem>
    <name>nodeadkeyscustom</name>
    <description>Portuguese (Brazil, no dead keys custom)</description>
  </configItem>
</variant>

```
