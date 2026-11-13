FROM quay.io/fedora-ostree-desktops/silverblue:45@sha256:da752e4d0e8573e95e9de085f2cd957771b44c87add4dcb5f81aa8a692cbc96a

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
