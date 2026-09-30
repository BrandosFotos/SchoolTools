export PATH=/opt/homebrew/bin:$PATH

export PATH="$PATH:/Users/brandonwhite/.local/bin"

export TERM=xterm-256color
export NVIM_TUI_ENABLE_TRUE_COLOR=1



export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"


# Alias definitions
alias vi='nvim'
alias vim='nvim'
alias ls='ls -a'
alias cls='clear'
alias weather='curl -s "wttr.in/?format=3"'

# SSH Aliases (Redacted for security)
alias styx='ssh brandon@seedboxsomewhere.com'
alias vps='ssh brandon@thesite.dev'
alias win22='ssh brandon@privatedns.ca'

# Directory Aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias myip='curl -s https://ifconfig.me'
alias localip="ipconfig getifaddr en0"


# NPM 
if command -v npm >/dev/null 2>&1; then
    alias ni='npm install'
    alias nrs='npm run'
    alias nrd='npm run dev'
    alias nrb='npm run build'
    alias nrsx='npm run start'
    alias nrt='npm run test'
    alias nrl='npm run lint'
    alias ncu='npm update'
fi

if command -v pnpm >/dev/null 2>&1; then
    alias pni='pnpm install'
    alias pnd='pnpm dev'
    alias pnb='pnpm build'
    alias pns='pnpm start'
fi

if command -v podman >/dev/null 2>&1; then
    alias p='podman'
    alias pps='podman ps'
    alias ppsa='podman ps -a'
    alias pi='podman images'
    alias plogs='podman logs'
    alias pexec='podman exec -it'
    alias pc='podman compose'
    alias pcu='podman compose up -d'
    alias pcd='podman compose down'
fi


# To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'
alias grep="/usr/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS



#Prompt
PROMPT='%1~: '
