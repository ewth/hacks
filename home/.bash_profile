# Add `/usr/local/bin` to the `$PATH`
# export PATH="/usr/local/opt/php@7.0/bin:/usr/local/opt/php@7.0/sbin:/usr/local/bin:usr/local/sbin:$PATH"
# export PATH="/usr/local/opt/php@7.1/bin:/usr/local/opt/php@7.1/sbin:/usr/local/bin:usr/local/sbin:$PATH"

# Add xdebug support to cli
# export XDEBUG_CONFIG="idekey=PHPSTORM"

# Add `~/dev/flutter` to the `$PATH`
export PATH="$PATH:~/dev/flutter/bin"

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# Add `~/.gems/bin` to the `$PATH`
export PATH="$HOME/.gems/bin:$PATH"

# Add /usr/local/sbin to the path
export PATH="/usr/local/sbin:$PATH"

# Add
export PATH="$PATH:$HOME/.composer/vendor/bin"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

# Add git completion as of http://code-worrier.com/blog/autocomplete-git/
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# BEGIN SNIPPET: Automatically added by the Platform.sh CLI
export PATH='/Users/ewan/.platformsh/bin':"$PATH"
[ -f '/Users/ewan/.platformsh/shell-config.rc' ] && . '/Users/ewan/.platformsh/shell-config.rc' # END SNIPPET

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT="/Users/ewan/dev/cocos2d-x-3.17/tools/cocos2d-console/bin"
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT="/Users/ewan/dev"
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT="/Users/ewan/dev/cocos2d-x-3.17/templates"
export PATH=$COCOS_TEMPLATES_ROOT:$PATH
