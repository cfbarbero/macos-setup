## Homebrew
# export PATH="/usr/local/opt/apr/bin:$PATH"

## PyEnv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

USER_BASE_PATH=$(python -m site --user-base)
export PATH=$PATH:$USER_BASE_PATH/bin

USER_BASE_PATH=$(python3 -m site --user-base)
export PATH=$PATH:$USER_BASE_PATH/bin

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# TGENV
export PATH=$PATH:$HOME/.tgenv/bin

## iTerm shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

### Git helpers
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

## Shell Prompt
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
### user@hostname path/to/directory (git state)$
PS1='\u@\h \w$(__git_ps1 " (%s)")\$ '

export PATH="$HOME/.local/bin:$PATH"

# Increase bash history
export HISTFILESIZE=1000000
export HISTSIZE=1000000

### GOLANG
export GOPATH=$HOME/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin


### NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh


### AWS AutoComplete
complete -C /usr/local/bin/aws_completer aws


### Aliases
alias profile="code ~/.bash_profile"
alias reload_profile="source ~/.bash_profile"
alias dotfiles="code ~/projects/cfbarbero/dotfiles"
alias update_dotfiles="source ~/projects/cfbarbero/dotfiles/bootstrap.sh"
alias al='awssaml -u $USER'
alias al-sb1='awssaml -u $USER -a "dhisandbox1:DHI-PowerUser" -d'
alias al-sb2='awssaml -u $USER -a "dhisandbox2:DHI-PowerUser" -d'
alias al-shrdsvcdev='awssaml -u $USER -a "dhishrdsvcdev:DHI-PowerUser" -d'
alias al-shrdsvcprod='awssaml -u $USER -a "dhishrdsvcprod:DHI-PowerUser" -d'
alias al-dhiprod='awssaml -u $USER -a "dhiprod:DHI-PowerUser" -d'
alias al-shrdsvcall='awssaml -u $USER -a "dhishrdsvcdev:DHI-PowerUser" -a "dhishrdsvcprod:DHI-PowerUser"'

alias dc="docker-compose"

alias hosts="sudo vim /etc/hosts"
alias reload-dns="sudo killall -HUP mDNSResponder"

alias create-venv="python3 -m venv --system-site-packages .venv"
alias activate-venv="source .venv/bin/activate"
alias av='activate-venv'

alias dhi="cd ~/projects/dhi"

alias bright="brightness 1"

alias influxcli="influx -host 'marty-cd873146.influxcloud.net' -ssl -precision rfc3339"
# ------------------------------------
# Docker alias and function
# ------------------------------------

# Get latest container ID
alias dl="docker ps -l -q"

# Get container process
alias dps="docker ps"

# Get process included stop container
alias dpa="docker ps -a"

# Get images
alias di="docker images"

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
alias dki="docker run -i -t -P"

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"

# Stop all containers
dstop() { docker stop $(docker ps -a -q); }

# Remove all containers
drm() { docker rm $(docker ps -a -q); }

# Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Remove all images
dri() { docker rmi $(docker images -q); }

# Dockerfile build, e.g., $dbu tcnksm/test 
dbu() { docker build -t=$1 .; }

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

# Bash into running container
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }
### Functions