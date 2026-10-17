FROM quay.io/fedora-ostree-desktops/silverblue:45@sha256:e07dbd6f34b0049f9b8616cccc8f1076ffb46e8a0995357598aee38193b8cdea

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
