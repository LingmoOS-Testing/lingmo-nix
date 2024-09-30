![Welcome Banner](https://github.com/user-attachments/assets/61c61e0c-edf0-4542-9423-507acc1f6ba6)

# LingmoNix ( In Rebuilding )
## Preface
LingmoOS Project started up a project that ported LingmoOS to NixOS. Its codename now called "LingmoNix". Nix, as a functional programming language, a purely declarative package manager, and the basis of NixOS, the revolutionary declarative distribution for Linux, is influencing every aspect of the computer world. We're more than happy to start this program and guarantee that your experience is in sync with LingmoOS.



Rebuilding the system... Next Beta release - *LingmoOS "Yaksha"* will released in Winter 2025!


### (On Top) Winter Develop Plans!
  PS. Oh Sorry, I don't know We'll finish the plan at the day-offs of October. LMAO :)

  SO the current plan is to discovery how to build our customized NixOS ISO now!
  
  - ~System Label: NixOS -> LingmoOS~
  - ~New Version: LingmoOS Nix "Yaksha" (LingmoOS Nix 5.02)~ It'll be changed in /etc/issue later.
  - ~Nixpkgs to port:.~ Done.
### Announcement
- License changed from MIT to GPL-3.0 now. The purpose of this action is to prevent our open source software from being referenced at will. (The same as the upcoming Yaksha & Our custom Nixpkgs.)
- No GPG Keys needed to "sign" the nixpkgs repository. Because NixOS is related with GitHub :). What's more if we have binary cache in [Cachix](cachix.org), we'll use narinfo instead of GPG Keys. Even the EXP of maintainer's GPG Key is in Jul, 2025.
  
## Contents

- Installation
- Build & Development (NixOps)
- Nixpkgs Source

## Installation

Coming Soon with LingmoNix's branding new Shell-based installation script - Yaksha.

## Build & Developments 
Build A Generic ISO for different archtectures: [NixOS Maunal](https://nixos.org/manual/nixos/stable/#sec-building-image)

We're discovering how to build a LingmoNix ISO. In the certain stage we only supported to generated NixOS's Generic ISO here.

Supported: amd64, arm, raspberrypi, etc.

~You also can contribute nixpkgs and your NixOS build on it.~ Move to Another repository [hydrogen-nixpkgs](https://github.com/LingmoOS-Testing/hydrogen-nixpkgs) to contribute your Nixpkgs.

Visit [Nixpkgs Manual](https://nixos.org/manual/nixpkgs/stable/) to learn what is Nixpkgs. (May useful to build LingmoOS apps in NixOS.)

Visit [NixOS Manual](https://nixos.org/manual/nixos/stable) to learn what is NixOS.

Visit [NixOS Wiki](https://nixos.wiki/wiki/Nixpkgs/Create_and_debug_packages) to learn how to build Nixpkgs. (Important in compiled LingmoOS Apps to NixOS executable binary packages.)

## Nixpkgs Source
~This is also a nixpkg source station now. The repository name in Nix configurations is `github:LingmoOS-Testing/lingmo-nix`. Better use in `flake.nix`!~ Remove to github:LingmoOS-Testing/hydrogen-nixpkgs now. This Nixpkgs Source won't be maintained, but the distribution's release will show here.
~
