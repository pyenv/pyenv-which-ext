remove_from_path() {
  local path_to_remove="$1"
  local path_before
  local result=":$PATH:"
  while [ "$path_before" != "$result" ]; do
    path_before="$result"
    result="${result//:$path_to_remove:/:}"
  done
  result="${result%:}"
  echo "${result#:}"
}

lookup_from_path() {
  PATH="$(remove_from_path "${PYENV_ROOT}/shims")" command -v "$1" || true
}

# If the "$PYENV_COMMAND_PATH" does not exist,
if [ -n "$PYENV_COMMAND" ] && [ ! -x "$PYENV_COMMAND_PATH" ]; then
  PYENV_COMMAND_PATH="$(lookup_from_path "$PYENV_COMMAND")"
fi
