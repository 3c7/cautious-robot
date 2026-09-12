#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

dnf5 -y copr enable niri-wm/niri

# We use this copr repository for noctalia-greeter-git
dnf5 -y copr enable lionheartp/Hyprland
dnf5 -y install niri noctalia ghostty zsh noctalia-greeter-git

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging
dnf5 -y copr disable niri-wm/niri
dnf5 -y copr disable lionheartp/Hyprland

#### Example for enabling a System Unit File

systemctl enable podman.socket
systemctl disable sddm.service
systemctl enable greetd
