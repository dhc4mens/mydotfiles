# Fish設定
set -g fish_greeting ""

# 環境変数
set -x EDITOR vim
set -x BROWSER firefox
set -x TERM xterm-256color

# パス設定
fish_add_path ~/.local/bin
fish_add_path ~/.krew/bin

# プロンプト設定（starship使用推奨）
if command -v starship > /dev/null
    starship init fish | source
end

# AWS Profile切り替え関数
function aws_profile
    set -l profile (aws configure list-profiles | fzf)
    if test -n "$profile"
        set -gx AWS_PROFILE $profile
        echo "AWS Profile set to: $profile"
    end
end

# Kubernetes Context切り替え関数
function kubectl_context
    set -l context (kubectl config get-contexts -o name | fzf)
    if test -n "$context"
        kubectl config use-context $context
        echo "Kubernetes context set to: $context"
    end
end

# Docker cleanup関数
function docker_cleanup
    echo "Cleaning up Docker..."
    docker system prune -f
    docker volume prune -f
    docker image prune -f
end

# Aliases
alias ll 'ls -alF'
alias la 'ls -A'
alias l 'ls -CF'
alias .. 'cd ..'
alias ... 'cd ../..'

# Docker aliases
abbr d docker
abbr dc docker-compose
abbr k kubectl
abbr tf terraform
abbr ans ansible
abbr awsp aws_profile
abbr kctx kubectl_context
