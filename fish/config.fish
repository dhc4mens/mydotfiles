if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias d docker
alias di 'docker images'
alias dps 'docker ps'
alias dex 'docker exec -it'
alias db 'docker build'
alias dp 'docker pull'
alias drmi 'docker rmi'
alias dr 'docker run'
alias dst 'docker stop'
alias dk 'docker kill'
alias drm 'docker rm'

alias dc 'docker-compose'
alias dcu 'docker-compose up -d'
alias dcd 'docker-compose down'
alias dlog 'docker logs -f'
alias dcps 'docker-compose ps'
alias dcb 'docker-compose build'

alias vf 'vi ~/.config/fish/config.fish'
alias sf 'source ~/.config/fish/config.fish'

alias sstart 'sudo systemctl start'
alias sstatus 'sudo systemctl status'

function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'  # Ctrl+r で履歴検索
  bind \ce 'peco_select_history (commandline -b)'  # Ctrl+e でも履歴検索
end

function peco_select_history
    set -l history (commandline -b)
    commandline -r (echo $history | peco --query "$argv")
end

cd ~
