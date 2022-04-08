
# If you come from bash you might have to change your $PATH.
# Path to your oh-my-zsh installation.
export ZSH=/Users/janosch/.oh-my-zsh

# For compilers to find zlib you may need to set:
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/zlib/lib"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/zlib/include"

# For pkg-config to find zlib you may need to set:
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/zlib/lib/pkgconfig"

export LDFLAGS="${LDFLAGS} -L/usr/local/opt/sqlite/lib"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/sqlite/include"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/sqlite/lib/pkgconfig"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
## See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="wezm"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  vi-mode
  git
  autojump
  poetry
  zsh-syntax-highlighting
  zsh-autosuggestions
  aws
)

# VI Mode settings
export KEYTIMEOUT=10
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M viins 'kj' vi-cmd-mode
VI_MODE_SET_CURSOR=true

source $ZSH/oh-my-zsh.sh

# compdef sshrc=ssh

#source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

# User configuration
export EDITOR=vi
export GOPATH=/Users/janosch/Documents/arbeit/work

export AWS_DEFAULT_REGION=eu-central-1
export CDK_DEFAULT_REGION=eu-central-1

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -lta'
alias p='open -a preview'

alias tmux='tmux -2'
alias muxi='mux JANI'
alias vim='lvim' 
alias v='lvim' 

alias sconf='lvim /Users/janosch/.ssh/config'

alias updatedb="gupdatedb --localpaths='/Users/janosch' --output='/Users/janosch/.tmp/locatedb'"
alias locate="glocate"
alias spoof="sudo spoof randomize en0"

alias cat='bat'
alias ping='prettyping --nolegend'
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

alias webshare='python -m SimpleHTTPServer 8000'
alias webshareExt='python -m SimpleHTTPServer 8000 & ngrok http 8000 && fg'

alias av='aws-vault'
acc() { source /Users/janosch/.set_profile.sh "$@"}

#alias toki='python3.9 /Users/janosch/.tokenSchleuder/token_neu/tokenschleuder/tokenschleuder.py -u janoschoffenberg -l arn:aws:iam::352137982028:role/ServiceTeamInterneAnwendungen -s saml --store'
#alias toki-new='python3.9 /Users/janosch/.tokenSchleuder/token_neu/tokenschleuder/tokenschleuder.py -u janoschoffenberg -l arn:aws:iam::352137982028:role/ServiceTeamDASTeam -s samlTEAM --store'

#alias dast-iatd='cloudaccess profile -d -a dast-iat'
#alias dast-prdd='cloudaccess profile -d -a dast-prd'
#alias dast-iat='cloudaccess profile -a dast-iat'
#alias dast-prd='cloudaccess profile -a dast-prd'

#alias cio-iatd='cloudaccess profile -d -a cio-iat'
#alias cio-prdd='cloudaccess profile -d -a cio-prd'
#alias cio-iat='cloudaccess profile -a cio-iat'
#alias cio-prd='cloudaccess profile -a cio-prd'

#alias dast-iatdr='cloudaccess profile -d -a dast-iat -r 300'
#alias dast-prddr='cloudaccess profile -d -a dast-prd -r 300'
#alias dast-iatr='cloudaccess profile -a dast-iat -r 300'
#alias dast-prdr='cloudaccess profile -a dast-prd -r 300'

#alias cio-iatdr='cloudaccess profile -d -a cio-iat -r 300'
#alias cio-prddr='cloudaccess profile -d -a cio-prd -r 300'
#alias cio-iatr='cloudaccess profile -a cio-iat -r 300'
#alias cio-prdr='cloudaccess profile -a cio-prd -r 300'

alias lightroom='sh /Users/janosch/.open_lightroom'
#alias pip='pip3'
#git config --global user.email "janosch.offenberg@superluminar.io"
#git config --global user.name "Janosch Offenberg"

# complete -C '/usr/local/bin/aws_completer' aws
export PATH="/Users/janosch/.bin:/Users/janosch/.pyenv/shims:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/usr/local/go/bin:/usr/local/MacGPG2/bin:/opt/X11/bin:/usr/local/git/bin:/Users/janosch/.local/bin"
export PATH=/Users/janosch/.cargo/bin:$HOME/.bin:/usr/local/bin:/usr/local/m-cli:$PATH
export PATH="/usr/local/sbin:$PATH"
# eval "$(pyenv init -)"

# export AWS_DEFAULT_PROFILE=play
# export AWS_PROFILE=play
# export AWS_REGION=eu-central-1

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#export PATH="/usr/local/sbin:$PATH"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

eval "$(/opt/homebrew/bin/brew shellenv)"

# export PATH="$HOME/.jenv/bin:$PATH"
# eval "$(jenv init -)"
# DISABLE_MAGIC_FUNCTIONS=true

if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
	# autoload -Uz compinit
	# compinit
fi

#zprof

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

skip_global_compinit=1
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh -xv

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}
# zprof # enable if performance testing ist done 
