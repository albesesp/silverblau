FROM quay.io/fedora-ostree-desktops/silverblue:45@sha256:84e76593236c31744daeadeba4e56016d80814342651ae0abf234be935911876

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
