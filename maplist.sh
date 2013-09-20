#!/bin/sh

echo "#"
echo "# Half-Life Dedicated Server Maplist generator"
echo "#"

#
# Where the root of your dedicated server is.
#
HLDS_HOME=/opt/hlds

#
# Look for the game folder we're generating a list from.
#
if [ -z $1 ]
then
  echo "Please supply a game type (folder). E.G. \"cstrike\""
  exit 1
fi

#
# Where your dedicated server game files are located.
#
GAME_HOME=$HLDS_HOME/serverfiles/$1

#
# Where to look for maps to generate a list from.
#
SEARCH=$GAME_HOME/maps

#
# Find maps and hold the output here.
#
RESULTS=`cd $SEARCH; find *.bsp | sed -r s/.bsp$//g`

#
# If no filename was supplied, dump out to stdout
#
if [ -z $2 ]
then
  printf '%s\n' $RESULTS
  exit 0
fi

#
# A filename was supplied, write it.
#
printf '%s\n' $RESULTS > $2
exit 0
