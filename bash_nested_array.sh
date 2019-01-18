#!/bin/bash
# credit to https://stackoverflow.com/a/23930212 user 'new-kid' provided the code that was referenced to make this.
# backup old IFS, this should be done in case this code is added to a larger script that has other commands that use IF
S.
oIFS="$IFS"

# set new IFS to delimit only with new line
IFS=$'\n'

# since we are wanting to essentially have a nested array we create a multi line variable that has our subarray fields
delimited by '|', or something else if you need it, it just can't be in the text you are processing.
read -r -d '' service_list <<EOM
http|Removing Apache service...
vsftp|Removing VSFTP service...
gcc*|Removing GCC compiler...
EOM

# now process each line of the service_list variable.
for line in $service_list
do

# reset IFS to use '|' as it's delimiter.
  IFS='|'
# set new array with the contents of the line variable.
  arr=($line)
# echo special message that is unique to your command.
  echo "${arr[1]}"
# run your command.
  echo "yum remove ${arr[0]}"
done
# reset your IFS to the old one.
IFS="$oIFS"
