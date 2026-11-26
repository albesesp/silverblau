FROM quay.io/fedora-ostree-desktops/silverblue:45@sha256:189f5843c3c2a9af90e75e8fb32c9bcb1666a47ed9f59c1de9cf605e527bf5f5

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
