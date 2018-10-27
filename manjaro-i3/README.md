Intro
-----
This is a general configuration of my majaro-i3 linux distro.

Grub
----
For further information, refer [Grub archwiki](https://wiki.archlinux.org/index.php/GRUB).

### Themes
Currently I'm using a very nice theme called [fallout-grub-theme](https://github.com/shvchk/fallout-grub-theme). Two more themes from the same author, [poly-light](https://github.com/shvchk/poly-light) and [ploy-dark](https://github.com/shvchk/poly-dark), are recommended as well.

Grub theme is usually stored in `/boot/grub/themes/` or `/usr/share/grub/themes/`. To change themes, copy theme folder to the location above, and modify `GRUB_THEME=your_theme_path/theme.txt` in file `/etc/default/grub`. In order to apply changes to `grub`, regenerate grub configeration file `grub.cfg` by `grub-mkconfig -o /boot/grub/grub.cfg`.

### Config
The config file `/boot/grub/grub.cfg` is generated based on variaties of options in `/etc/default/grub` and scripts in `/etc/grub.d/`.

`grub.cfg` has to be regenerated after any change to `/etc/default/grub` or files in `/etc/grub.d/`. Use _grub-mkconfig_ tool to generate `grub.cfg`:

```
grub-mkconfig -o /boot/grub/grub.cfg
```

To change resolution in `/etc/default/grub`, modify `GRUB_GFXMODE=1234x567`. Change theme as indicated above.

To add __reboot__ and __shutdown__ entries in boot menu, add below to script `/etc/grub.d/40_custom`:

```
menuentry "System shutdown" {
    echo "System shutting down..."
    halt
}

menuentry "System restart" {
    echo "System rebooting..."
    reboot
}
```

To edit other entries, one easy way is to modify the file `grub.cfg`, but it will be overwritten once it is regenerated. The other choice is to modify scripts in `/etc/grub.d/`.

oh-my-zsh
---------

### Theme
Current theme in setting is [spaceship](https://github.com/denysdovhan/spaceship-prompt). To work correctly, better use [nerd-fonts](https://github.com/ryanoasis/nerd-fonts). Right now I am using `DejaVuSansMono Nerd Font Mono`.

To set up theme, clone the repo into `$ZSH-CUSTOM/theme`(by default `~/.oh-my-zsh/custom/theme):

```
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
```

Symlink `spaceship.zsh-theme` to your oh-my-zsh custom themes directory:

```
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```

Set `ZSH_THEME="spaceship"` in your `.zshrc`.

### Plugin
#### fast-syntax-highlighting
Clone [`fast-syntax-highlighting`](https://github.com/zdharma/fast-syntax-highlighting) repository into `$ZSH-CUSTOM/plugins`(by default `~/.oh-my-zsh/custom/plugins):


```
git clone https://github.com/zdharma/fast-syntax-highlighting.git \
  ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting
```

Then add `fast-syntax-highlighting` to `plugins` list.

#### zsh-autosuggestions
Clone [`zsh-autosuggestions`](https://github.com/zsh-users/zsh-autosuggestions) repository into `$ZSH-CUSTOM/plugins`(by default `~/.oh-my-zsh/custom/plugins):

```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Then add `zsh-autosuggestions` to `plugins` list.
