#####################
###### Aliases ######
#####################

if [ -f ~/.bash_local_aliases ]; then
    . ~/.bash_local_aliases
fi

# Press space after using a substitution like !:2* to see what would be filled
# in before execution
bind Space:magic-space

alias dotfiles='/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'


# fzf with preview
alias fzfp="fzf --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'"

# cd to selected directory
cdf() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# cd into the directory of the selected file
cdfile() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}


fif() {
    # find in file
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

# fzf/git tools
fbr() {
  # checkout git branch (including remote branches), sorted by most recent commit, limit 30 last branches
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

fco() {
  # checkout git branch/tag
  local tags branches target
  branches=$(
    git --no-pager branch --all \
      --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" \
    | sed '/^$/d') || return
  tags=$(
    git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
  target=$(
    (echo "$branches"; echo "$tags") |
    fzf --no-hscroll --no-multi -n 2 \
        --ansi) || return
  git checkout $(awk '{print $2}' <<<"$target" )
}


fcop () {
  # checkout git branch/tag, with a preview showing the commits between the tag/branch and HEAD
  local tags branches target
  branches=$(
    git --no-pager branch --all \
      --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" \
    | sed '/^$/d') || return
  tags=$(
    git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
  target=$(
    (echo "$branches"; echo "$tags") |
    fzf --no-hscroll --no-multi -n 2 \
        --ansi --preview="git --no-pager log -150 --pretty=format:%s '..{2}'") || return
  git checkout $(awk '{print $2}' <<<"$target" )
}

#fcoc() {
#  # checkout git commit
#  local commits commit
#  commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
#  commit=$(echo "$commits" | fzf --tac +s +m -e) &&
#  git checkout $(echo "$commit" | sed "s/ .*//")
#}

# fshow() {
#   # git commit browser
#   git log --graph --color=always \
#       --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
#   fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
#       --bind "ctrl-m:execute:
#                 (grep -o '[a-f0-9]\{7\}' | head -1 |
#                 xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
#                 {}
# FZF-EOF"
# }

alias glNoGraph='git log --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr% C(auto)%an" "$@"'
_gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
_viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always % | diff-so-fancy'"

# checkout git commit with previews
fcoc() {
  local commit
  commit=$( glNoGraph |
    fzf --no-sort --reverse --tiebreak=index --no-multi \
        --ansi --preview="$_viewGitLogLine" ) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

# git commit browser with previews
fshow() {
    glNoGraph |
        fzf --no-sort --reverse --tiebreak=index --no-multi \
            --ansi --preview="$_viewGitLogLine" \
                --header "enter to view, alt-y to copy hash" \
                --bind "enter:execute:$_viewGitLogLine   | less -R" \
                --bind "alt-y:execute:$_gitLogLineToHash | xclip"
}

function git-fixup () {
  git ll -n 20 | fzf | cut -f 1 | xargs git commit --no-verify --fixup
}

# browse chrome history
c() {
  local cols sep google_history open
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  if [ "$(uname)" = "Darwin" ]; then
    google_history="$HOME/Library/Application Support/Google/Chrome/Default/History"
    open=open
  else
    google_history="$HOME/.config/google-chrome/Default/History"
    open=xdg-open
  fi
  cp -f "$google_history" /tmp/h
  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs $open > /dev/null 2> /dev/null
}

# Various
alias beep="echo -e '\a'"
alias bim="vim"
alias vimr="vim -R"
alias vimf='vim $(fzfp)'
alias vimt='vim -c Tags'
alias vimrc='vim ~/.vimrc'
alias todo="vim -c 'Note To Do'"
alias resource="source ~/.bash_profile"
alias ls="ls -1G"
alias please='sudo $(history -p !!)'

# Python
alias black="black --line-length 100"

# Jupyter
alias jtdark="jt \
  -N \
  -T \
  -t onedork \
  -f inconsolata \
  -fs 10 \
  -cellw 99% \
  -nf exosans \
  -tf exosans \
"
alias jtlight="jt \
  -N \
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

function chrome() {
  chrome=/Applications/Chrome.app
  if [[ -f $1 ]]; then
    open -a $chrome "$1"
  else
    open -a $chrome "https://$1"
  fi
}
