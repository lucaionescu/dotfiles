function cipssh() {
  if [ "$*" == "" ]; then
    ssh ionescu@remote.cip.ifi.lmu.de
  else
    ssh -X -o 'ProxyCommand ssh -W %h:%p ionescu@remote.cip.ifi.lmu.de' ionescu@"$1"
  fi
}

# create a new directory and enter it
function mk() {
  mkdir -p "$@" && cd "$@"
}

# change to directory and list content
function cdl() {
  cd "$1" && l
}

# save man page as pdf
function pdfman() {
  man -t $@ | ps2pdf - "$@.pdf"
}

