#!/bin/bash

echo "Installing apps..."

# === VS Code ===

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf install code

# === Brave Browser ===
echo "Installing Brave Browser..."

sudo dnf install dnf-plugins-core -y
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo -y
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf check-update -y
sudo dnf install brave-browser -y

# === Filen ===
echo "Opening Filen Desktop App download page..."
xdg-open "https://filen.io/apps/desktop" &
