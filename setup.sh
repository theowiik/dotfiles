#!/bin/bash

run_apps=false
update_everything=false

# === Updating the system ===
sudo dnf check-update -y

if [ "$update_everything" = true ]; then
  echo "Updating everything..."
  sudo dnf upgrade -y
fi

# === Installing bspwm ===
echo "Installing bspwm..."
sudo dnf install bspwm -y

# === Installing apps ===
if [ "$run_apps" = true ]; then
  echo "Running apps.sh..."
  source ./apps.sh
fi

# === Installing Zsh ===
echo "Installing Zsh..."
sudo dnf install zsh -y

# === Installing Oh My Zsh ===
echo "Installing Oh My Zsh..."
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Setting Zsh as the default shell
chsh -s $(which zsh)

echo "Setup completed!"
