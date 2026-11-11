FROM quay.io/fedora-ostree-desktops/silverblue:45@sha256:ad5218dd7e8fac92af0639b4c2fbd948b724a46efe9eb6210c7aad41aeb5290a

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
