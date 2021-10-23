#!/bin/bash
#!/bin/sh

# reset jetbrains ide evals:
# Version: 2021.2.2
# Build: 212.5284.41
# Released: 14 September 2021

OS_NAME=$(uname -s)
JB_PRODUCTS="IntelliJIdea CLion PhpStorm GoLand PyCharm WebStorm Rider DataGrip RubyMine AppCode"

for PRD in $JB_PRODUCTS; do
  rm -rf ~/.cache/JetBrains/
  rm -rf ~/.config/JetBrains/
  rm -rf ~/.java/.userPrefs/jetbrains/
  rm -rf ~/.local/share/JetBrains/
done
