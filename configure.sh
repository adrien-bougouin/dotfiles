#!/usr/bin/env sh

DOTFILES_ROOT=$(dirname $0)
TARGETS=(
  "root:/"
  "home:${HOME}"
)

should_stow() {
  local program=$1

  [ $(command -v "${program}") ] \
    || [ -d "/etc/${program}" ] \
    || return 1
}

for target_desc in ${TARGETS[@]}; do
  IFS=: read stow_prefix target_dir <<< "${target_desc}"

  stow_dir="${DOTFILES_ROOT}/${stow_prefix}_stow"
  if [ ! -d "${stow_dir}" ]; then continue; fi

  for program in $(ls "${stow_dir}"); do
    if $(should_stow ${program}); then
      action="Stowing contents of package '${program}' (wd=${target_dir})..."
      echo "${action}"
      stow --verbose 1 \
        --simulate \
        --dir "${stow_dir}" \
        --target "${target_dir}" \
        --stow "${program}"
      echo "${action} done"
    fi
  done
done
