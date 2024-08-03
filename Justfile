# ###################################################### #
#                                                        #
# NixOS命令简化版，使用Just编写，与Makefile相似但是又不同      #
# Just是一个一种保存和运行项目特有命令的批处理器，              #
# 不过请确保您的NixOS主机里安装了Just                        #
# 如没有安装，运行 nix-shell -p just 即可使用                #
# 本模板来源于：github:ryan4yin/nix-config/Justfile        #
# 适用于NixOS 24.05                                       #
#                                                        #
######################################################## #

# 用法：just + 指令（Justfile中定义的指令，在这里专门叫配方）
# 例如：just deploy将运行sudo nixos-rebuild switch

#!/usr/bin/env -S just --justfile

deploy:
  sudo nixos-rebuild switch 

debug:
  sudo nixos-rebuild test

sync:
  sudo nixos-rebuild build

up:
  nix flake update  # 需要加上主机名


upf:
  sudo nix flake update $(i)

uph:
  sudo home-manager switch  # 同23行

history:
  sudo nix profile history --profile /nix/var/nix/profiles/system

nixshell:
  sudo nix repl     # 这里定义的是just nixshell，启动的是Nix语言的交互终端。请勿和nix-shell以及nix develop, nix shell等nix-shell的3个New CLI混淆。谢谢！

clean:
  # remove all generations older than 7 days
  sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

gc:
  # garbage collect all unused nix store entries
  sudo nix store gc --debug
  sudo nix-collect-garbage --delete-old

viconf:
  sudo nano /etc/nixos/configration.nix

viflake:
  sudo nano /etc/nixos/flake.nix    # Flakes文件一般放在你的/home中，除非你放在了/etc/nixos中
  sudo nano flake.nix   # 假设你的文件放在/home/username中，就请注释掉38行，反之则注释掉这一行

vihome:
  sudo nano ~/.config/home-manager/home.nix # NixOS 24.05中，Home-manager文件将写入/home/username/.config/home-manager中而并不是~/.config/nixpkgs中

syncmirror: 
  sudo nix-channel --update

upmirror: 
  sudo nix-channel --add    # 这里在--add后面添加镜像url

listmirror: 
  sudo nix-channel --list

# 一次性更新home-manager, flake以及系统更新
syncall: 
  sudo nixos-rebuild switch --show-trace && sudo nix flake update --show-trace && sudo home-manager switch --show-trace && reboot

# 不喜欢您的最新构建的配置？一键回滚，安全带您回到旧配置
rollback:
  sudo nix-env --rollback

# 假设使用了带有unfree licence许可的应用？没关系我们也帮您配置了
# 临时使用
unfreepkg enable:
  export NIXPKGS_ALLOW_UNFREE=1
# 永久更改
unfreepkg switch:
  echo "NIXPKGS_ALLOW_UNFREE=1" >> .bashrc    # 这样看来貌似你在NixOS中又写了一个bash的配置文件，但是两个文件都是有效的
  source .bashrc