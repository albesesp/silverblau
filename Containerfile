FROM quay.io/fedora-ostree-desktops/silverblue:45@sha256:27e52b6acfe39335341f3866f3ff415f4ec153b284b21ec14f2cae8994127bb8

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
