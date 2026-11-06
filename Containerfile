FROM quay.io/fedora-ostree-desktops/silverblue:45@sha256:63250009d4529db0a33d965fde9405f720c3a27dba76bb913fa7f4f321889e76

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
