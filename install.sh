#!/usr/bin/env bash

set -e

DOTFILES_DIR="$HOME/.dotfiles"

IGNORES=(
  ".git"
  ".gitignore"
  "install.sh"
  "LICENSE"
  "README.md"
)

cd "$DOTFILES_DIR" || exit 1

should_ignore() {
  local file="$1"
  for ignore in "${IGNORES[@]}"; do
    [[ "$file" == "$ignore" ]] && return 0
  done
  return 1
}

for item in .* *; do
  [[ "$item" == "." || "$item" == ".." ]] && continue
  if should_ignore "$item"; then
    continue
  fi
  TARGET="$HOME/$item"

  if [ -e "$TARGET" ] && [ ! -L "$TARGET" ]; then
    mv "$TARGET" "$TARGET.bak.$(date +%s)"
    echo "backup $TARGET to $TARGET.bak.$(date +%s)"
  fi

  [ -L "$TARGET" ] && rm -f "$TARGET"

  ln -sv "$DOTFILES_DIR/$item" "$TARGET"
done

echo "🎉 done"
