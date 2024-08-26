NC='\033[0m'

BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT_GRAY='\033[0;37m'

DARK_GRAY='\033[1;30m'
LIGHT_RED='\033[1;31m'
LIGHT_GREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHT_BLUE='\033[1;34m'
LIGHT_PURPLE='\033[1;35m'
LIGHT_CYAN='\033[1;36m'
WHITE='\033[1;37m'

ColorPrint() {
  if [ $# -eq 1 ]; then
    printf "$1"
  else
    index=0
    for arg in $@; do
      if [ $index -lt 2 ]; then
        printf $arg
      else
        printf " $arg"
      fi
      ((index++))
    done
    printf $NC
  fi
}

NoColor() {
  ColorPrint $NC
}

Black() {
  ColorPrint $BLACK $1
}
Red() {
  ColorPrint $RED $1
}
Green() {
  ColorPrint $GREEN $1
}
Orange() {
  ColorPrint $ORANGE $1
}
Blue() {
  ColorPrint $BLUE $1
}
Purple() {
  ColorPrint $PURPLE $1
}
Cyan() {
  ColorPrint $CYAN $1
}
LightGray() {
  ColorPrint $LIGHT_GRAY $1
}

DarkGray() {
  ColorPrint $DARK_GRAY $1
}
LightRed() {
  ColorPrint $LIGHT_RED $1
}
LightGreen() {
  ColorPrint $LIGHT_GREEN $1
}
Yellow() {
  ColorPrint $YELLOW $1
}
LightBlue() {
  ColorPrint $LIGHT_BLUE $1
}
LightPurple() {
  ColorPrint $LIGHT_PURPLE $1
}
LightCyan() {
  ColorPrint $LIGHT_CYAN $1
}
White() {
  ColorPrint $WHITE $1
}
