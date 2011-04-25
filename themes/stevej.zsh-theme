

PROMPT='%{$fg_bold[red]%}$(host_prompt) %{$fg_bold[green]%}%~
%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} $(prompt_char) %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

function host_prompt {
  HOSTNAME=`hostname`
  if [ $HOSTNAME = "lambda" ] ; then
    echo 'λ' && return
  elif [ $HOSTNAME = "beta" ] ; then
    echo 'β' && return
  elif [ $HOSTNAME = "eta" ] ; then
    echo 'η' && return
  else
    echo $HOSTNAME && return
  fi
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '∓∓∓' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    svn info >/dev/null 2>/dev/null && echo '₪' && return
    darcs changes >/dev/null 2>/dev/null && echo '≫' && return
    echo '$'
}
