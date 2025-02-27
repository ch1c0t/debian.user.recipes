# To execute the recipe at a specific path, at $1.
function execute-mitamae-recipe-at {
  local path_type=$(file $1 -b)

  case $path_type in
    directory)
      mitamae local $1/default.rb
      ;;
    *)
      case ${1:e} in
        rb)
          mitamae local $1
          ;;
        list)
          echo "Executing a list of recipes at $1:"
          # https://superuser.com/questions/1044405/shell-script-output-indentation
          cat $1 | paste /dev/null - | expand -4

          local line
          # https://unix.stackexchange.com/questions/739262/for-loop-and-reading-a-text-file
          for line in ${(f)"$(<$1)"}; do
            execute-mitamae-recipe-at $MITAMAE_PATH_TO_RECIPES/$line
          done
          ;;
      esac
      ;;
  esac
}
