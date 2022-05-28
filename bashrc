source '/home/mh/.alias'

TTY=`tty`

red="\033[0;31m"
bold="\033[0;1m"
reset="\033[0m"

PS1="$red┌[$bold\u$red@$bold\H$red] [$bold$TTY$red] [${bold}bash ${red} ]\n└[$bold\w$red]> $reset"
PS2=" $red|> $reset"

# ulimit -c 100000

colorscript.sh random
