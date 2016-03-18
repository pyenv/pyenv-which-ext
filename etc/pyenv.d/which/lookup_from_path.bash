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
  local command_to_lookup="$1"
  local original_path="${PATH}"
  PATH="$(remove_from_path "${PYENV_ROOT}/shims")"
  local result="$(command -v "$command_to_lookup" || true)"
  PATH="${original_path}"
  echo "$result"
}

# If the "$PYENV_COMMAND_PATH" does not exist,
if [ -n "$PYENV_COMMAND" ] && [ ! -x "$PYENV_COMMAND_PATH" ]; then
  PYENV_COMMAND_PATH="$(lookup_from_path "$PYENV_COMMAND" || true)"
fi
