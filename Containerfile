FROM quay.io/fedora-ostree-desktops/silverblue:45@sha256:ba43beab44d1278702023ed4580d03d95d0d69ca919a4cabc5000a82f9802c09

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
