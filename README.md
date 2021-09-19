# Ubuntu configuration file

my personal configuration files


## Additional Programs:

### Webstorm:
https://www.jetbrains.com/pt-br/webstorm/ <br/>
* Font: JetBrains Mono | 16px | L.H 1.1 <br>

### Responsively:
https://responsively.app/

### auto-cpufreq
https://github.com/AdnanHodzic/auto-cpufreq

## Run install script

``sudo bash install.sh``

## Aditional Extensions
https://extensions.gnome.org/

1 - https://extensions.gnome.org/extension/750/openweather/ <br/>
2 - https://extensions.gnome.org/extension/841/freon/

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
