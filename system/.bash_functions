function cipssh() {
  ssh -X -o 'ProxyCommand ssh -W %h:%p ionescu@remote.cip.ifi.lmu.de' ionescu@"$1"
}

# Create a new directory and enter it
function mk() {
  mkdir -p "$@" && cd "$@"
}