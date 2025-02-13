#!/bin/sh
reponame="$1"

if [ "$reponame" = "" ]; then
    read -p "Enter Github Repository Name: " reponame
fi

echo "Please enter username:"
read USERNAME

read -p "Please enter your personal access token:" TOKEN

if [ -z "$USERNAME" ] || [ -z "$TOKEN" ]; then
    echo "Username or token is empty, aborting the script..."
else
    mkdir ./$reponame
    cd $reponame
    curl -u $USERNAME:$TOKEN https://api.github.com/user/repos -d "{\"name\":\"$reponame\"}"
    git init
    echo "ADD README CONTENT" > README.md
    git add README.md
    git commit -m "Starting Out"
    git remote add origin https://$USERNAME:$TOKEN@github.com/${USERNAME}/$reponame.git
    git branch -M main
    git push -u origin main
fi

