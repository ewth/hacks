# My dotfiles

## Installation

### Dotfiles

```
# Install homesick
gem install homesick

# Clone repository
homesick clone erfanimani/dotfiles

# Link dotfiles
homesick symlink dotfiles
```
Also see https://github.com/technicalpickles/homesick

### Install Homebrew formulae

```
cd ~/.homesick/repos/dotfiles/
./.brew
```

### Install native apps

```
./.cask
```

### OSX Settings

```
./.osx
```

### Symlink sublimetext settings

```
./.sublime
# or the following if you want to override the current settings
./.sublime --force
```