#!/bin/bash

repoName="arcdps-extension"
repoFirstLetter="${repoName:0:1}"
"${arcdps-extension:0:1}"
repo="knoxfighter/$repoName"
file="ports/$repoName/portfile.cmake"

#- Get head ref branch
branch=$(awk '/.*HEAD_REF (.*)/{ print $2 }' $file)

#- get latest commit hash
commits=$(curl -sL "https://api.github.com/repos/${repo}/commits/${branch}")

commitSha=$(echo "$commits" | jq -r '.sha')
echo "$commitSha"

#- download tar & create sha512
sha512=$(curl -sL "https://github.com/${repo}/archive/${commitSha}.tar.gz" | sha512sum -b -z | cut -d " " -f 1)
echo "$sha512"

#- update portfile
sed -i -E "s/(.* REF )(.*)/\1${commitSha}/" $file
sed -i -E "s/(.* SHA512 )(.*)/\1${sha512}/" $file

#- commit changes
git add "$file"
git commit -m "updated $repoName port"

#- get commit rev of folder
rev=$(git rev-parse "HEAD:ports/$repoName/")

#- put hash into version json
versionFile="versions/${repoFirstLetter}-/${repoName}.json"
versionFileTmp="$versionFile.tmp"
mv "$versionFile" "$versionFileTmp"
jq '.versions[0]."git-tree" = "test"' "$versionFileTmp" > "$versionFile"
rm "$versionFileTmp"

#- commit
git add "$versionFile"
git commit -m "updated $repoName version"
