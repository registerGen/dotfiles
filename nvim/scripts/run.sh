#!/usr/bin/env bash
# Usage: run.sh <src_file> <exe_file>

src="$1"
exe="$2"

if [ $# -ne 2 ]; then
  echo "Usage: $0 <src_file> <exe_file>"
  exit 2
fi

ext="${src##*.}"

case "$ext" in
  cpp|cc|cxx)
    interactive_indicator="// interactive"
    compile_cmd=(
      g++
      -DREGISTERGEN
      -O2
      -Wall
      -Wextra
      -Wconversion
      -I /home/registergen/oi/include/ac-library
      -I /home/registergen/oi/include/testlib
      -o "$exe"
      "$src"
    )
    run_cmd=("./$exe")
    ;;

  rs)
    interactive_indicator="// interactive"
    compile_cmd=(
      rustc
      -O
      "$src"
      -o "$exe"
    )
    run_cmd=("./$exe")
    ;;

  hs)
    interactive_indicator="-- interactive"
    compile_cmd=(
      ghc
      -O2
      -Wall
      -odir /tmp/run-hs
      -hidir /tmp/run-hs
      -o "$exe"
      "$src"
    )
    run_cmd=("./$exe")
    ;;

  *)
    echo "Unsupported language: .$ext"
    echo "Supported extensions: .cpp .cc .cxx .rs .hs"
    exit 2
    ;;
esac

interactive_flag=0

while IFS= read -r line; do
  if [ "$line" == "$interactive_indicator" ]; then
    interactive_flag=1
    break
  fi
done < "$src"

if ! "${compile_cmd[@]}"; then
  echo -e "\033[1;4;31mCompilation failed\033[0m"
  exit 1
else
  echo -e "\033[1;4;32mCompilation succeeded\033[0m"
fi

if [ "$interactive_flag" -eq 1 ]; then
  "${run_cmd[@]}"
else
  base="$(basename "$src")"
  out_file="/tmp/${base}_out"
  err_file="/tmp/${base}_err"

  "${run_cmd[@]}" >"$out_file" 2>"$err_file"

  echo -e "\033[1;4;34mstdout:\033[0m"
  cat "$out_file"
  echo

  echo -e "\033[1;4;34mstderr:\033[0m"
  cat "$err_file"
  echo

  rm -f "$out_file" "$err_file"
fi
