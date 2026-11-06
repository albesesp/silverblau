FROM quay.io/fedora-ostree-desktops/silverblue:45@sha256:e990bbc7c11c16ba1ddeef327232404de35c487f8df27eebf43c62245380f281

RUN --mount=type=tmpfs,target=/run \
    --mount=type=tmpfs,target=/tmp \
    --mount=type=tmpfs,target=/var \
    <<EOF
set -xeuo pipefail

dnf -y install \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

dnf -y install distrobox steam
dnf -y install mesa-va-drivers-freeworld.{i686,x86_64}
dnf -y swap mesa-vulkan-drivers{,-freeworld}
dnf -y swap mesa-vulkan-drivers{,-freeworld}.i686
dnf -y swap ffmpeg-free ffmpeg --allowerasing
dnf -y install mpv
dnf -y swap ptyxis gnome-console
dnf -y remove firefox

dnf clean all
EOF

LABEL containers.bootc 1
LABEL ostree.bootable 1

RUN bootc container lint --fatal-warnings
