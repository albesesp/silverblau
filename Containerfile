FROM quay.io/fedora-ostree-desktops/silverblue:45@sha256:f770b68ec2114fd15465ce7cf5efdfc9ac91d12f78e7371f634fc62bdd723167

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
