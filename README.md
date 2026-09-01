# Qimah Al-Safinah Files — desktop client

A branded build of the upstream [Nextcloud desktop client](https://github.com/nextcloud/desktop),
for internal use at Qimah Al-Safinah. Licensed **GPL-2.0-or-later**, same as upstream.

Branding lives in [`QIMAH.cmake`](QIMAH.cmake); everything else tracks upstream so
changes can be merged in cleanly. Windows installers are built by
[`.github/workflows/windows-release.yml`](.github/workflows/windows-release.yml)
and published as run artifacts.
