if [[ -d "$HOME/android.sdk" ]]; then
  export ANDROID_USER_HOME="$HOME/.android"
  export ANDROID_HOME=$HOME/android.sdk
  export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

  if [ -d "$ANDROID_HOME/build-tools" ]; then
    build_tools=$(
      command ls "$ANDROID_HOME/build-tools" |
        sort --version-sort --reverse |
        head -n 1
    )

    export PATH="$ANDROID_HOME/build-tools/$build_tools:$PATH"
  fi

  if [ -d "$ANDROID_HOME/platform-tools" ]; then
    export PATH=$PATH:$ANDROID_HOME/platform-tools
  fi
fi
