

PROMPT='%{$fg_bold[red]%}$(host_prompt) %{$fg_bold[green]%}%~
%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} $(prompt_char) %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

function host_prompt {
  case `hostname` in
    "lambda" ) echo 'λ';;
    "eta"    ) echo 'η';;
    "beta"   ) echo 'β';;
    *        ) echo `hostname`;;
  esac
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '∓∓∓' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    svn info >/dev/null 2>/dev/null && echo '₪' && return
    darcs changes >/dev/null 2>/dev/null && echo '≫' && return
    echo '$'
}
