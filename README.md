![Welcome Banner](https://github.com/user-attachments/assets/61c61e0c-edf0-4542-9423-507acc1f6ba6)

# LingmoOS Nix Edition ( In Rebuilding )
## Preface
LingmoOS Project started up a project that ported LingmoOS to NixOS. Its codename now called "LingmoNix". Nix, as a functional programming language, a purely declarative package manager, and the basis of NixOS, the revolutionary declarative distribution for Linux, is influencing every aspect of the computer world. We're more than happy to start this program and guarantee that your experience is in sync with LingmoOS.

## ( GitBook Docs release now! )
## Rebuilding the system... Next Beta release - *LingmoOS "Yaksha"* will released in Winter 2025!

### (On Top) Winter Develop Plans!
  - System Label: NixOS -> LingmoOS
  - New Version: LingmoOS Nix "Yaksha" (LingmoOS Nix 5.02)
  - Nixpkgs to port: **LingmoUI**, **Cutefish**, **LingmoOS's Official Wallpapers & Plymouth Theme, and the SPEICIAL WALLPAPERS from our project**.
### Announcement
- License changed from MIT to GPT-3.0 now. The purpose of this action is to prevent our open source software from being referenced at will.
- While cloning the repository, please add the **PGP Key**.
  ```
  pub   rsa4096 2024-07-14 [SC] [EXP：2025-07-14]
      35F588798A4A85F6DA12684CA4DBCC9F9744B7F1
  uid             [ 绝对 ] Lancelot Constantine Cayde (arkimium Innovation official on @GitHub) <114994536+arkimium@users.noreply.github.com>
  sub   rsa4096 2024-07-14 [E] [EXP：2025-07-14]
  ```
  This PGP Key will be unused on 14 Jul, 2025. *Next year the PGP Key will be changed and be supported in next 3 years.*
  
## Contents

- Installation
- Features in LingmoNix
- Featured softwares (Continuously updateing)
  - Just
- Build & Development (NixOps)
- Nixpkgs Source

## Installation

  - 1. Clone repository
  ```bash
  gh repo clone LingmoOS-Testing/lingmo-nix     // Contains GitHub CLI, if not, then use git.
  ``` 
  - 2. Copy the cofigurations and build it on your NixOS host.
  ```bash
  cd lingmo-nix/etc
  sudo cp -r etc/* /etc/nixos
  sudo nixos-rebuild switch

  ## For Chinese users, if cache.nixos.org cannot be connected or slowly connection, then run:
  sudo nixos-rebuild switch --option substituters "https://mirrors.ustc.edu.cn/nix-channels/store"
  ```

  - 3. Rebooting NixOS, then press **Enter** directly. (And now you may should have two configurations on your GRUB 2 menu.)

## Features in LingmoNix

TODO

## Featured softwares

in continuously updateing

   - Just

> View source on [github:casey/just](https://github.com/casey/just)
   
> It is a *command-runner* use on every platform. Its grammar was inspired by **Makefile**. You can simplify existing commands in `just ${commands}`. Or Writing a `Justfile` to define commands. Now is more used in Arch and NixOS.

## Build & Developments 

TODO, Log on [Nix & NixOS](nixos.org) to find more infomations.

You also can contribute nixpkgs and your NixOS build on it.

Run `man configuraiton.nix` to get help about control your NixOS in one file.

Visit [Nixpkgs Manual](https://nixos.org/manual/nixpkgs/stable/) to learn what is Nixpkgs. (May useful to build LingmoOS apps in NixOS.)

Visit [NixOS Manual](https://nixos.org/manual/nixos/stable) to learn what is NixOS.

Visit [NixOS Wiki](https://nixos.wiki/wiki/Nixpkgs/Create_and_debug_packages) to learn how to build Nixpkgs. (Important in compiled LingmoOS Apps to NixOS executable binary packages.)

## Nixpkgs Source
This is also a nixpkg source station now. The repository name in Nix configurations is `github:LingmoOS-Testing/lingmo-nix`. Better use in `flake.nix`!
