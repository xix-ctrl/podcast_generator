#!/bin/bash

echo "=================="

#stores data of those using the action
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.name "${INPUT_EMAIL}"
git config --global --add SAFE.DIRECTORY /github/workspace

#runs python and calls to file stored in user/bin
python3 /usr/bin/feed.py

#feeds the files back upstream to main on the github server
git add -A && git commit -m "Update Feed"

git push --set-upstream origin main 

echo "=================="