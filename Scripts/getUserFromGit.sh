#!/bin/bash

REPO_OWNER=$1
REPO_NAME=$2

#function get_data{
#	URL=https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/issues
#	curl -L $URL | jq -r '.[].user.login'
#}

if [ $# != 2 ]; then
	echo "Please pass REPO_OWNER and REPO_NAME arguments to scripts"
else
	echo -e "Checking the response from URL \n"
	URL=https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/issues
        response=`curl -L -s -w "\n%{http_code}\n"  $URL -o response.json`
        #cat response.json | jq -r '.[].user.login'
        http1_code=$(head -n2 <<< "$response")
        #cat response.json | jq -r '.[].user.login'
        #echo "$http1_code"
	if [ $http1_code == 200 ]; then 
		echo "Listing the Users"
		cat response.json | jq -r '.[].user.login'

        else
		echo "URL is unable to reach or REPO_OWNER and REPO_NAME are incorrect"
	
	fi
fi	
