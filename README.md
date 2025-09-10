# リポジトリ構造
dotfiles/
├── README.md
├── install.sh                 # 自動インストールスクリプト
├── bash/
│   ├── .bashrc
│   ├── .bash_profile
│   ├── .bash_aliases
│   └── functions.sh
├── fish/
│   ├── config.fish
│   ├── functions/
│   │   ├── aws_profile.fish
│   │   ├── kubectl_context.fish
│   │   └── docker_cleanup.fish
│   └── completions/
├── git/
│   ├── .gitconfig
│   ├── .gitignore_global
│   └── hooks/
│       ├── pre-commit
│       └── commit-msg
├── kubernetes/
│   ├── kubectl_aliases
│   ├── k9s/
│   │   └── skin.yml
│   └── helm/
│       └── .helmrc
├── vim/
│   ├── .vimrc
│   └── .vim/
│       ├── colors/
│       └── plugin/
├── tmux/
│   └── .tmux.conf
├── ansible/
│   ├── ansible.cfg
│   └── hosts
└── scripts/
    ├── aws_assume_role.sh
    ├── k8s_pod_logs.sh
    ├── docker_system_prune.sh
    └── security_audit.sh
