FROM quay.io/fedora-ostree-desktops/silverblue:45@sha256:3620c890c5bf5c9be322c06a7c9ec3913652f3ef70a41a180f7aaa7187751f06

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
