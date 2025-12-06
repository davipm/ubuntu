#!/bin/bash

# JetBrains IDE trial reset script for macOS (2024–2025 versions)
# Works with: IntelliJ IDEA, PyCharm, WebStorm, PhpStorm, CLion, GoLand, RubyMine, DataGrip, Rider, AppCode, Fleet, etc.

products=(
    "IntelliJIdea"
    "PyCharm"
    "WebStorm"
    "PhpStorm"
    "CLion"
    "GoLand"
    "RubyMine"
    "DataGrip"
    "Rider"
    "AppCode"
    "Fleet"
)

echo "JetBrains trial reset for macOS"
echo "=================================="

for product in "${products[@]}"; do
    echo "[+] Processing $product ..."

    # Use a glob to find all matching versioned config directories
    shopt -s nullglob 2>/dev/null || true  # Enable nullglob if available (bash 4+)
    config_dirs=("$HOME/Library/Application Support/JetBrains/${product}"*)

    # If nullglob isn't supported (e.g., macOS default bash 3.2), check if the glob didn't expand
    if [[ ${#config_dirs[@]} -eq 1 && ! -d "${config_dirs[0]}" ]]; then
        # Either no match or literal string with *
        if [[ "${config_dirs[0]}" == *"/*" ]]; then
            # Unexpanded glob → no matches
            config_dirs=()
        else
            # Might be a non-versioned folder; test it
            config_dirs=("$HOME/Library/Application Support/JetBrains/$product")
        fi
    fi

    # If still no valid dirs, try the non-versioned fallback
    if [[ ${#config_dirs[@]} -eq 0 ]] || [[ ! -d "${config_dirs[0]}" ]]; then
        non_versioned="$HOME/Library/Application Support/JetBrains/$product"
        if [[ -d "$non_versioned" ]]; then
            config_dirs=("$non_versioned")
        else
            config_dirs=()
        fi
    fi

    # Process each found config directory
    for config_dir in "${config_dirs[@]}"; do
        [[ -d "$config_dir" ]] || continue

        echo "    → Cleaning eval folder in $config_dir"
        rm -rf "${config_dir}/eval" 2>/dev/null
        rm -rf "${config_dir}/options/evlsprt"* 2>/dev/null

        # Remove evaluation properties from other.xml (new format)
        other_xml="${config_dir}/options/other.xml"
        if [[ -f "$other_xml" ]]; then
            echo "    → Removing evlsprt entries from other.xml"
            # macOS sed requires -i '' for in-place editing
            sed -i '' '/evlsprt/d' "$other_xml" 2>/dev/null
        fi
    done
done

# Remove the persistent userPrefs store (most important part on recent versions)
echo "[+] Removing permanent evaluation storage..."
rm -rf "$HOME/Library/Application Support/JetBrains/consentOptions" 2>/dev/null
rm -rf "$HOME/Library/Preferences/jetbrains."* 2>/dev/null   # wildcard for jetbrains.* files

# Old-style .userPrefs (Java preferences) – still used by some versions
echo "[+] Removing Java .userPrefs (old method)..."
rm -rf "$HOME/Library/Preferences/.java/.userPrefs/jetbrains" 2>/dev/null
rm -rf "$HOME/.java/.userPrefs/jetbrains" 2>/dev/null

# Optional: clean up old config locations (harmless if not present)
rm -rf "$HOME/.config/JetBrains" 2>/dev/null
rm -rf "$HOME/.config/Google" 2>/dev/null   # Android Studio sometimes

echo
echo "All done! You can now open any JetBrains IDE and start a new 30-day trial."
echo "Note: This is for evaluation/testing purposes only."