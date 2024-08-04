![Welcome Banner](https://github.com/user-attachments/assets/61c61e0c-edf0-4542-9423-507acc1f6ba6)

# LingmoOS Nix Edition
## Preface
LingmoOS Project started up a project that ported LingmoOS to NixOS. Its codename now called "LingmoNix". Nix, as a functional programming language, a purely declarative package manager, and the basis of NixOS, the revolutionary declarative distribution for Linux, is influencing every aspect of the computer world. We're more than happy to start this program and guarantee that your experience is in sync with LingmoOS.

(Hey! Chinese documents will be available soon, please wait for Chinese users! ）

## Contents

- Installation
- Features in LingmoNix
- Featured softwares (Continuously updateing)
  - Just
- Build & Development (NixOps)

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

   View source on [github:casey/just](https://github.com/casey/just)
   It is a *command-runner* use on every platform. Its grammar was inspired by **Makefile**. You can simplify existing commands in `just ${commands}`. Or Writing a `Justfile` to define commands. Now is more used in Arch and NixOS.

## Build & Developments 

TODO, Log on [Nix & NixOS](nixos.org) to find more infomations.

You also can contribute nixpkgs and your NixOS build on it.

Run `man configuraiton.nix` to get help about control your NixOS in one file.

Visit [Nixpkgs Manual](https://nixos.org/manual/nixpkgs/stable/) to learn what is Nixpkgs. (May useful to build LingmoOS apps in NixOS.)

Visit [NixOS Manual](https://nixos.org/manual/nixos/stable) to learn what is NixOS.

Visit [NixOS Wiki](https://nixos.wiki/wiki/Nixpkgs/Create_and_debug_packages) to learn how to build Nixpkgs. (Important in compiled LingmoOS Apps to NixOS executable binary packages.)
