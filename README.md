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
- https://iriun.com/
- https://protonvpn.com/
- https://proton.me/pt-br/mail
- https://www.morgen.so/

## Aditional Extensions
- https://extensions.gnome.org/extension/750/openweather/
- https://extensions.gnome.org/extension/841/freon/
- https://extensions.gnome.org/extension/1460/vitals/
- https://extensions.gnome.org/extension/1465/desktop-icons/
- https://extensions.gnome.org/extension/945/cpu-power-manager/

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
