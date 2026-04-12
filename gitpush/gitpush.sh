#!/bin/bash 

if [ "$#" -ne 1 ]; then 
	echo "missing commit message... Aborting!"
	exit 1
fi 

COMMIT_MESSAGE="$1"

echo "Verifying internet connection..."
if ! ping -c 2 github.com  &>/dev/null; then
	echo "Connection error, cannot connect to github, check your internet connection or try later!"
	exit 1
fi

git fetch --quiet

COMMITS_BEHIND=$(git rev-list --count HEAD..@{u} 2>/dev/null)

if [ $? -ne 0]; then 
	echo "No remote branch configured! Check repository configuration first..."
	exit 1 
fi

if [ "$COMMITS_BEHIND" -gt 0]; then 
	echo "Warning! There are $COMMITS_BEHIND to pull first! aborting..."
	echo "Use git pull to pull the latest software..."
	exit 1
fi 

echo "repository up to date..."

git add . && git diff --staged --quiet && { echo "no file to commit... Aborting"; exit 1; } 
git commit -m "$COMMIT_MESSAGE"
git push origin main
