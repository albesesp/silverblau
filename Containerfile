FROM quay.io/fedora-ostree-desktops/silverblue:45@sha256:c6e228510e2ab41b18caf0859a55f0ec65a6d2210024762c64b32171f0630150

RUN <<EOF
set -xeuo pipefail

dnf -y install \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

dnf -y install steam

dnf -y install \
    gstreamer1-plugins-bad-freeworld \
    gstreamer1-plugins-ugly

dnf -y install mesa-va-drivers-freeworld.{i686,x86_64}

dnf -y swap mesa-vulkan-drivers{,-freeworld}
dnf -y swap mesa-vulkan-drivers{,-freeworld}.i686

dnf -y remove firefox
dnf -y swap ptyxis gnome-console
dnf -y remove rpmfusion-{free,nonfree}-release

dnf clean all

rm /run/dnf /run/setrans /tmp/* /var/* -rf
mkdir /var/tmp
chmod 1777 /var/tmp
EOF

LABEL containers.bootc 1
LABEL ostree.bootable 1

RUN bootc container lint --fatal-warnings
