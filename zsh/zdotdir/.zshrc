. $ZDOTDIR/setopt.sh
. $ZDOTDIR/bindkey.sh
. $ZDOTDIR/completion.sh
. /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
. /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. $ZDOTDIR/env.sh
. $ZDOTDIR/alias.sh
. $ZDOTDIR/prompt.sh
. $ZDOTDIR/git.sh
. $ZDOTDIR/fzf.sh
. $ZDOTDIR/execute-mitamae-recipe.sh
. $ZDOTDIR/history.sh
. $ZDOTDIR/mise.sh
. $ZDOTDIR/android.sh
. $ZDOTDIR/flutter.sh
. $ZDOTDIR/zoxide.sh

for f in $ZDOTDIR/zsh.d/*.{sh,zsh}(N); do
  source $f
done
