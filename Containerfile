FROM quay.io/fedora-ostree-desktops/silverblue:45@sha256:e990bbc7c11c16ba1ddeef327232404de35c487f8df27eebf43c62245380f281

RUN --mount=type=tmpfs,target=/run \
    --mount=type=tmpfs,target=/tmp \
    --mount=type=tmpfs,target=/var \
    <<EOF
set -xeuo pipefail

dnf -y install steam-devices
dnf -y remove firefox
dnf -y swap ptyxis gnome-console
dnf clean all
EOF

LABEL containers.bootc 1
LABEL ostree.bootable 1

RUN bootc container lint --fatal-warnings
