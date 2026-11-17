FROM quay.io/fedora-ostree-desktops/silverblue:45@sha256:0a49300b25240e90520954d9c8b845358e2b818437b378182568fc93766075ea

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
