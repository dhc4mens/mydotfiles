# History設定
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoreboth
shopt -s histappend

# プロンプト設定（Git branch表示付き）
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# AWS Profile表示
aws_profile_prompt() {
    if [ -n "$AWS_PROFILE" ]; then
        echo " [aws:$AWS_PROFILE]"
    fi
}

# Kubernetes Context表示
k8s_context_prompt() {
    local context=$(kubectl config current-context 2>/dev/null)
    if [ -n "$context" ]; then
        echo " [k8s:$context]"
    fi
}

PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[01;33m\]$(aws_profile_prompt)\[\033[01;36m\]$(k8s_context_prompt)\[\033[00m\]\$ '

# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Docker aliases
alias d='docker'
alias dc='docker-compose'
alias dps='docker ps'
alias dimg='docker images'
alias drmi='docker rmi $(docker images -q)'
alias drmf='docker rm $(docker ps -aq)'

# Kubernetes aliases
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kgd='kubectl get deployments'
alias kdp='kubectl describe pod'
alias kl='kubectl logs'
alias kns='kubectl config set-context --current --namespace'

# AWS aliases
alias awsp='export AWS_PROFILE=$(aws configure list-profiles | fzf)'
alias awsr='aws sts get-caller-identity'
alias ec2='aws ec2 describe-instances --query "Reservations[*].Instances[*].{Name:Tags[?Key==\`Name\`]|[0].Value,Instance:InstanceId,Type:InstanceType,State:State.Name,IP:PublicIpAddress}" --output table'

# System aliases
alias ports='netstat -tulanp'
alias meminfo='free -m -l -t'
alias cpuinfo='lscpu'
alias diskusage='df -H'
alias foldersize='du -sh'

# Security aliases
alias checkports='nmap -sT -O localhost'
alias firewall='sudo iptables -L -n -v --line-numbers'
alias listening='lsof -i -P | grep LISTEN'
