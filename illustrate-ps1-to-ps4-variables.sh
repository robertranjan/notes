
#!/bin/bash

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

PS1="${red}my-PS1-prompt $ ${reset}"
PS2="${red}PS2 continuation >${reset}"
PS3="${red}PS3 your option? ${reset}"
PS4="${red}PS4 ++${reset}"

books="${green}Genesis${reset} ${green}Exodus${reset} ${green}Leviticus${reset} ${green}Numbers${reset} ${green}Deuteronomy${reset} quit"

#select law in ${green}Genesis${reset} Exodus Leviticus Numbers Deuteronomy quit; do
select law in $books ; do
if [[ $law == "quit" ]] ; then
	break
fi
echo you selected book: $law
done


printf "\n==========\n${green}To see PS2 in action, please copy paste below lines 'one at a time' and press enter${reset}\n
   PS2='PS2 continuation >'
   select law in $books ; do
   if [[ \$law == 'quit' ]] ; then
     break
   fi

ctrl+d to quit
${reset}"
