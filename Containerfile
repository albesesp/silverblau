FROM quay.io/fedora-ostree-desktops/silverblue:45@sha256:5c2a0fed872cf7676c3341b32b53f3ee5d5e1599095b52f1908ac8dce5edca1c

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
