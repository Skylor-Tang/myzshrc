# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
)

source $ZSH/oh-my-zsh.sh

# User configuration

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Export 
# >>> zshrc-sync settings >>>
export ZSHRC_REPO_URL='git@github.com:Skylor-Tang/myzshrc.git'
export ZSHRC_FILE_PATH="$HOME/.zshrc"
# <<< zshrc-sync settings <<<

# >>> zplug settings >>>
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# plugs
# zplug "jeffreytse/zsh-vi-mode"
zplug "zsh-users/zsh-autosuggestions"
zplug "marlonrichert/zsh-autocomplete"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "Skylor-Tang/auto-venv", use:auto-venv.zsh, from:github, at:main
zplug "Skylor-Tang/zshrc-sync", use:zshrc-sync.zsh, from:github, at:main
zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# <<< zplug settings <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/tangmeijian/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/tangmeijian/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/tangmeijian/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/tangmeijian/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# >>> Homebrew settings >>>
export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
# <<<  Homebrew settings <<<

# Remove duplicate entries from PATH
# ==== 
remove_duplicates_from_path() {
    local -a unique_paths
    unique_paths=($(printf "%s\n" ${(u)path} | tr '\n' ':'))
    export PATH="${(@)unique_paths}"
}

remove_duplicates_from_path
# ==== End of remove_duplicates_from_path ====


# >>> autojump settings >>>
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
# <<< autojump settings <<<

# >>> My Script >>>
## create python venv
create_venv() {
    # 检查当前目录下是否已存在 venv 文件夹
    if [ -d "venv" ]; then
        echo "Python virtual environment already exists in the current directory."
        return 1
    fi

    # 创建虚拟环境
    python -m venv venv

    # 激活虚拟环境
    source ./venv/bin/activate

    # 检查虚拟环境是否创建成功
    if [[ "$(which python)" == "$(pwd)/venv/bin/python" ]]; then
        echo "Python virtual environment created successfully."
    else
        echo "Failed to create Python virtual environment."
    fi
}

## pwdc
pwdc() {
    local PWD_PATH
    PWD_PATH=$(pwd)
    echo -n "$PWD_PATH" | pbcopy  # 如果你使用 macOS，可以使用 pbcopy 命令来复制到剪贴板
    echo "Copied to clipboard: $PWD_PATH"
}

## clear_autosuggestions_history
clear_autosuggestions_history() {
    echo > ~/.zsh_history
    echo "zsh-autosuggestions 历史已清除。"
}

## clear pipx cache
function clear_pipx_cache() {
    local cache_dir="/Users/tangmeijian/.local/pipx/.cache"
    local tag_file="$cache_dir/CACHEDIR.TAG"

    echo "正在检查 $cache_dir 目录下的缓存..."

    if [[ -f "$tag_file" ]]; then
        echo "找到缓存目录标签。正在清除缓存..."
        # 找到并删除除了CACHEDIR.TAG之外的所有文件和目录
        find "$cache_dir" -mindepth 1 ! -name 'CACHEDIR.TAG' -exec rm -rf {} +
        echo "缓存已清除。"
    else
        echo "未找到缓存目录标签。为防止数据丢失，取消清理。"
    fi
}

##  Refresh Tmux settings by sourcing the Tmux configuration file
#
# This function first checks the value of the XDG_CONFIG_HOME environment variable.
# If it is set, it uses $XDG_CONFIG_HOME/tmux/tmux.conf as the path to the Tmux configuration file.
# If XDG_CONFIG_HOME is not set, it defaults to ~/.tmux.conf.
#
# If the configuration file is found, it is sourced using the 'tmux source'
# command. If the file is not found, an error message is printed.
function refresh_tmux_settings() {
    local conf="${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux.conf"

    if [ -f "$conf" ]; then
        tmux source "$conf"
        echo "Tmux settings refreshed successfully."
    else
        conf="$HOME/.tmux.conf"
        if [ -f "$conf" ]; then
            tmux source "$conf"
            echo "Tmux settings refreshed successfully."
        else
            echo "Error: Tmux configuration file not found at $conf"
            return 1
        fi
    fi
}

## alias
### script
alias speed='wget -O /dev/null http://speedtest.tele2.net/10MB.zip'
alias speedtest='/usr/bin/open -a "/Applications/Google Chrome.app" "http://www.speedtest.net/"'
### fast
alias vimzshrc="vim ~/.zshrc"
alias vim="nvim"
### docker
alias dms="docker inspect -f '{{range .Mounts}}{{.Source}} -> {{.Destination}} (RW: {{.RW}}, Mode: {{.Mode}}){{println}}{{end}}'"
alias dip="docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"
alias dxcit="docker exec -it"
## <<< My Script <<<

# >>> tmuxp settings >>>
export DISABLE_AUTO_TITLE='true'
# <<< tmuxp settings <<<


# >>> nvm >>>
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
# <<< nvm <<<


# terminal proxy
export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890

# Created by `pipx` on 2024-04-14 09:41:58
export PATH="$PATH:/Users/tangmeijian/.local/bin"

# Register my script
export PATH="$PATH:/Users/tangmeijian/.my-script/bash" 
# Register my script:python
mysql_connection_test() {
    /Users/tangmeijian/miniconda3/bin/python /Users/tangmeijian/.my-script/python/mysql_connection_test.py
}

redis_connection_test() {
    /Users/tangmeijian/miniconda3/bin/python /Users/tangmeijian/.my-script/python/redis_connection_test.py
}

watch_python() {
    /Users/tangmeijian/miniconda3/bin/python /Users/tangmeijian/.my-script/python/watch_python.py
}

