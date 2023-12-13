#!/bin/bash

# Updating the system
echo "Updating Fedora system..."
sudo dnf update -y

# Installing Zsh
echo "Installing Zsh..."
sudo dnf install zsh -y

# Installing Oh My Zsh
echo "Installing Oh My Zsh..."
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Setting Zsh as the default shell
chsh -s $(which zsh)

# Installing bspwm
echo "Installing bspwm..."
sudo dnf install bspwm -y

# Installing Brave Browser
echo "Installing Brave Browser..."

sudo dnf install dnf-plugins-core -y
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo -y
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc -y
sudo dnf install brave-browser -y

echo "Opening Filen Desktop App download page..."
xdg-open "https://filen.io/apps/desktop" &

echo "Setup completed!"
