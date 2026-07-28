#!/bin/sh
set -eu

rm -rf dist
mkdir -p dist

for item in * .*; do
  case "$item" in
    .|..|.git|dist) continue ;;
  esac

  if [ -e "$item" ]; then
    cp -R "$item" dist/
  fi
done

find dist -type f \( -name '*.html' -o -name '*.xml' \) -exec sed -i.bak 's#https://www.moraremipanema.com#https://moraremipanema.com#g' {} \;
find dist -type f -name '*.bak' -delete

printf 'Arquivos publicados com domínio canônico normalizado.\n'
