FROM quay.io/fedora-ostree-desktops/silverblue:45@sha256:730782143e1094ea5893afa48688af2345cfb214c48c6faa724dc4cae8747745

RUN --mount=type=tmpfs,target=/run \
    --mount=type=tmpfs,target=/tmp \
    --mount=type=tmpfs,target=/var \
    <<EOF
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

dnf clean all
EOF

LABEL containers.bootc 1
LABEL ostree.bootable 1

RUN bootc container lint --fatal-warnings
