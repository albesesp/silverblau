FROM quay.io/fedora-ostree-desktops/silverblue:45@sha256:659ddd4e57a1f459d99659645dcb554b25f5661469f551c8e4f096acf2d77264

RUN --mount=type=tmpfs,target=/run \
    --mount=type=tmpfs,target=/tmp \
    --mount=type=tmpfs,target=/var \
    <<EOF
set -xeuo pipefail

dnf -y remove firefox
dnf -y swap ptyxis gnome-console

dnf clean all
EOF

LABEL containers.bootc 1
LABEL ostree.bootable 1

RUN bootc container lint --fatal-warnings
