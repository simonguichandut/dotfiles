# Copy file's content to clipboard
catcp() {
  xclip -selection clipboard "$1"
}

# Self-prevent "git add ."
# Adding --yes overwrites this block, allowing "git add . --yes" to work as intended.
git() {
  if [[ "$1" == "add" ]]; then
    local args=()
    local saw_dot=0
    local saw_yes=0
    for a in "${@:2}"; do
      if [[ "$a" == "." ]]; then
        saw_dot=1
        args+=("$a")
      elif [[ "$a" == "--yes" ]]; then
        saw_yes=1
      else
        args+=("$a")
      fi
    done

    if (( saw_dot )) && (( ! saw_yes )); then
      if [[ -t 2 ]]; then
        printf '\n\t\033[31mBLOCKED\033[0m: use git add -p or explicit paths (or add --yes to confirm)\n\n' >&2
      else
        echo '\n\tBLOCKED: use git add -p or explicit paths (or add --yes to confirm)\n\n' >&2
      fi
      return 1
    fi

    command git add "${args[@]}"
    return $?
  fi

  command git "$@"
}

# Amend the previous commit with current staged changes
# Follow this up with a `git push --force-with-lease`
# Usage: git_fixup
git_fixup() {
  git commit --fixup HEAD && GIT_SEQUENCE_EDITOR=: git rebase -i --autosquash HEAD~2
}

