#!/bin/bash
#
# https://unix.stackexchange.com/questions/16255/how-can-i-change-whats-displayed-at-a-login-shell
# 
# NAME: now
# PATH: $HOME/bin
# DESC: Display current weather, calendar and time
# CALL: Called from terminal or ~/.bashrc
# DATE: Apr 6, 2017. Modified: Mar 30, 2018.
#
# NOTE: To display all available toilet fonts use this one-liner:
#       for i in ${TOILET_FONT_PATH:=/usr/share/figlet}/*.{t,f}lf; do j=${i##*/}; toilet -d "${i%/*}" -f "$j" "${j%.*}"; done

# Setup for 92 character wide terminal
DateColumn=45 # Default is 27 for 80 character line, 34 for 92 character line
TimeColumn=45 # Default is 49 for   "   "   "   "    61 "   "   "   "

#--------- WEATHER ----------------------------------------------------------

# Current weather, already in color so no need to override
echo " "
# Replace Edmonton with your city name, GPS, etc. See: curl wttr.in/:help
#
# https://github.com/chubin/wttr.in
#
curl --connect-timeout 3 http://wttr.in/?format=%l:+%C++%h++%t++%p++%w --silent
echo " "
echo " "
curl --connect-timeout 3 --silent "http://www.hko.gov.hk/textonly/forecast/englishwx.htm" | sed "/<[^>]*>/d;/^$/d;/^[^K].*degrees[;.]$/d;/^$/d" 2>/dev/null
#
#curl wttr.in?0 --silent --max-time 3
#
# Timeout #. Increase for slow connection---^
echo " "
echo " "                # Pad with blank lines for calendar & time to fit

#--------- DATE -------------------------------------------------------------

# calendar current month with today highlighted.
# colors 00=bright white, 31=red, 32=green, 33=yellow, 34=blue, 35=purple,
#        36=cyan, 37=white

tput sc                 # Save cursor position.
# Move up 9 lines
while [ $((++i)) -lt 9 ]; do tput cuu1; done

# Depending on length of your city name and country name you will:
#   1. Comment out next three lines of code. Uncomment fourth code line.
#   2. Change subtraction value and set number of print spaces to match
#      subtraction value. Then place comment on fourth code line.

Column=$(($DateColumn - 4))
tput cuf $Column        # Move x column number
#printf "          "     # Blank out ", country" with x spaces
printf "    "
#tput cuf $DateColumn    # Position to column 27 for date display

# -h needed to turn off formating:
#
# https://askubuntu.com/questions/1013954/bash-substring-stringoffsetlength-error/1013960#1013960
#
#
tmpfile=/tmp/tmp.$RANDOM.$RANDOM.$RANDOM.$$

cal > $tmpfile

CalLineCnt=1
Today=$(date +"%e")
# Prefix with space when length < 2
#if [[ ${#Today} < 2 ]] ; then
#    Today=" "$Today
#fi
#
# https://www.linux.org/threads/ansi-codes-and-colorized-terminals.11706/
#
printf "\033[36m"   # color green -- see list above.
while IFS= read -r Cal; do
    printf "$Cal"
    if [[ $CalLineCnt > 2 ]] ; then
        # See if today is on current line & invert background
        tput cub 20
        for (( j=0 ; j <= 18 ; j += 3 )) ; do
            Test=${Cal:$j:2}            # Current day on calendar line
            if [[ "$Test" == "$Today" ]] ; then
                printf "\033[37;7m"        # Reverse: [ 7 m
                printf "$Today"
                printf "\033[0m"        # Normal: [ 0 m
                printf "\033[36m"       # color green -- see list above.
                tput cuf 1
            else
                tput cuf 3
            fi
        done
    fi

    tput cud1               # Down one line
    tput cuf $DateColumn    # Move 27 columns right
    CalLineCnt=$((++CalLineCnt))
done < $tmpfile

printf "\033[37m"           # color -- bright white (default)

tput rc                     # Restore saved cursor position.

rm $tmpfile

exit 0

function showtime {
#-------- TIME --------------------------------------------------------------
#
tput sc                 # Save cursor position.
# Move up 9 lines
i=0
while [ $((++i)) -lt 10 ]; do tput cuu1; done

tput cuf $TimeColumn    # Move 49 columns right

# Do we have the toilet package?
if hash toilet 2>/dev/null; then
    echo " "$(date +"%I:%M %P")" " | \
        toilet -f future --filter border > $tmpfile
# Do we have the figlet package?
elif hash figlet 2>/dev/null; then
    echo $(date +"%I:%M %P") | figlet > $tmpfile
# else use standard font
else
    echo $(date +"%I:%M %P") > $tmpfile
fi

while IFS= read -r Time; do
    printf "\033[01;36m"    # color cyan
    printf "$Time"
    tput cud1               # Up one line
    tput cuf $TimeColumn    # Move 49 columns right
done < $tmpfile

tput rc                     # Restore saved cursor position.
}
