DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

. "$DIR/chulk.sh"
. "$DIR/now.sh"
. "$DIR/logger.sh"
