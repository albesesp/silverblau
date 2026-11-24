FROM quay.io/fedora-ostree-desktops/silverblue:45@sha256:550bbcaeab5d3ede70142b0aae7d221aea13b263430cf47df1af3fe4e6d398a1

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
