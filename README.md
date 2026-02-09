## This is my personal dotfiles

This is still a very new dotfiles configuration. Hopefully it will grow
usefully to my use.

The command below should have things set for WSL (for now)

```
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply FelipeCybis
```

# Pre-install requirements
1. Install chocolatey
```
winget install chocolatey
```
2. Install 'fzf'
```
winget install fzf
```
And install the module used to setup some pwsl configuration.
```
Install-Module -Name PSFzf -Scope CurrentUser
```
3. Install a nerd-font from : https://www.nerdfonts.com/font-downloads

4. Reboot the system and open a terminal in admin mode and run these commands :
```
choco install starship
```
```
choco install nvim
```
```
choco install chezmoi
```
```
choco install zoxide
```
# Install dotfile configuration with chezmoi
```
chezmoi init https://github.com/EstebanRivera08/dotfiles
```
Apply changes
```
chezmoi apply
```



