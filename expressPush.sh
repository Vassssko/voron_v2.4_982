#!/bin/bash

cd /home/pi/klipper_config

# get the argument message
#message="$1"

# Use current date time in the commit message when its not passed
#if [[ -z "${message// }" ]]
#    then
        message=$(date '+%Y-%m-%d %H:%M:%S')
#fi

# stage all changes
git add .
echo "Staged all files"

# add commit
git commit -m "$message"
echo "Added the commit with message: '$message'"

# get current branch and push
current_branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
git push origin "$current_branch"
echo "Push changes to '$current_branch' branch"
