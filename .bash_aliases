#####################
###### Aliases ######
#####################

alias dotfiles='/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Various
alias beep="echo -e '\a'"
alias bim="vim"
alias vimr="vim -R"
alias vimfzf='vim $(fzf)'
alias resource="source ~/.bash_profile"
alias ls="ls -1G"
alias please='sudo $(history -p !!)'

# Python
alias black="black --line-length 100"

# Jupyter
alias jtdark="jt \
  -T \
  -t onedork \
  -f inconsolata \
  -fs 10 \
  -cellw 99% \
  -nf exosans \
  -tf exosans \
"
alias jtlight="jt \
  -T \
  -t grade3 \
  -f inconsolata \
  -fs 10 \
  -cellw 99% \
  -nf exosans \
  -tf exosans
"

#SQL
alias sqlformat="sqlformat --reindent --identifiers lower --keywords upper --indent_columns --use_space_around_operators --wrap_after 0"

alias mywget="wget -e robots=off -r -nc -np --random-wait --no-cookies --accept mp3,m4a,flac"

alias ps1='export PS1="❯ "'

function weather {
    curl "http://wttr.in/$1"
}

function cls() {
    clear
    pwd
    echo
    ls -1 "$@"
    echo
}

function mkcd {
    mkdir $1
    cd $1
}

function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- $tempfile)" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat $tempfile)"
    fi
    rm -f -- "$tempfile"
}

