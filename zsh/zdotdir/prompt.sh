setopt PROMPT_SUBST

autoload -Uz vcs_info

print_prompt_header() {
  vcs_info
  print -rP "%F{green}●%f %(!.%F{red}%n%f.%n) %F{211}%3~%f ${vcs_info_msg_0_}"
}

precmd_functions+=(print_prompt_header)

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' formats '%F{153}%b%f%F{red}%c%u%m%f'

PROMPT="%(?..%F{red}%?%f)%# "
