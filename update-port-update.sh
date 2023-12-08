#!/bin/bash

# check if tools are installed
# curl, jq, git
function check_installed() {
	if ! command -v $1 &> /dev/null
	then
		echo "$1 could not be found, please install it"
		exit 1
	fi
}
check_installed curl
check_installed jq
check_installed git

printf "Please select a port:\n"
select d in ports/*; do test -n "$d" && break; echo ">>> Invalid Selection"; done
portName=${d#*/}
echo "Update $portName to the latest commit"

portfile="ports/$portName/portfile.cmake"

# get repo name
repo=$(awk '/.*REPO (.*)/{ print $2 }' $portfile)
repoFirstLetter=$(echo "$portName" | head -c 1)

#- Get head ref branch
branch=$(awk '/.*HEAD_REF (.*)/{ print $2 }' $portfile)

#- get latest commit hash
commits=$(curl -sL "https://api.github.com/repos/${repo}/commits/${branch}")

commitSha=$(echo "$commits" | jq -r '.sha')
echo "Commit hash $commitSha"

#- download tar & create sha512
sha512=$(curl -sL "https://github.com/${repo}/archive/${commitSha}.tar.gz" | sha512sum -b -z | cut -d " " -f 1)
echo "Sha512: $sha512"

#- update portfile
sed -i -E "s/(.* REF )(.*)/\1${commitSha}/" $portfile
sed -i -E "s/(.* SHA512 )(.*)/\1${sha512}/" $portfile

#- commit changes
git add "$portfile"
git commit -m "updated $portName port"

#- get commit rev of folder
rev=$(git rev-parse "HEAD:ports/$portName/")

#- put hash into version json
versionFile="versions/${repoFirstLetter}-/${portName}.json"
versionFileTmp="$versionFile.tmp"
mv "$versionFile" "$versionFileTmp"
jq --tab --arg rev "$rev" '.versions[0]."git-tree" = $rev' "$versionFileTmp" > "$versionFile"
rm "$versionFileTmp"

#- commit
git add "$versionFile"
git commit -m "updated $portName version"

echo "updated and commited port and version"
