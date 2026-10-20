# silverblau

A custom bootc image based on Fedora Silverblue.

## What's included

- Steam
- GStreamer bad/ugly plugins
- VA-API & Vulkan Mesa freeworld drivers (including i686)
- Firefox removed
- Ptyxis swapped for Console

## Installation

If you're on Fedora Silverblue, you can rebase directly to this image:

```sh
rpm-ostree rebase ostree-unverified-registry:ghcr.io/albesesp/silverblau:latest
```

Then reboot:

```sh
systemctl reboot
```

## Updating

Once rebased, updates are handled with `bootc`:

```sh
bootc upgrade
```

Reboot to apply the new image:

```sh
systemctl reboot
```
