FROM quay.io/fedora-ostree-desktops/silverblue:45@sha256:f591d89fc2b375c00d488fd08c90c17e8a4fa57c1631adb6ee3c3c61a86dc21a

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
