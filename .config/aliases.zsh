alias ls="ls --color=auto"
alias la="ls -a"
alias lt="ls --human-readable --size -1 -S --classify"
alias ..="cd .."
alias workon="cd $HOME/Projects/; cd"
alias dexec="docker-compose exec"
alias db="docker-compose exec mariadb mysql -u django -pdjango dbss"
alias dbe="docker-compose exec mariadb mysql -u django -pdjango dbss -e "
alias drun="docker-compose run --service-port --rm" #--name
alias j_bangla="ssh -J priutort@jump2.qvantel.net,priutort@10.74.42.6 priutort@" #host
alias black="black -l 79"
alias cleanpyc="sudo find . -type f -name '*.pyc' -delete"
