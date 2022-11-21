log() {
  echo -e $1
}

error() {
  log "\033[31m$1\033[0m"
}

check_exec() {
  command -v $1 > /dev/null || error "$1 not found"
}
