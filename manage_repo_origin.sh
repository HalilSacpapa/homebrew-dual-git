#! /bin/bash

names=()
for pubkey in ~/.ssh/*.pub; do
    names=(${names[@]} $(echo $pubkey | sed 's/.*\///' | sed 's/.pub//'))
done

echo "${#names[@]} ssh key found:"
i=1
for elem in ${names[@]}; do
    echo "\t$i. $elem"
    i=$((i+=1))
done
echo "\nWhich one do you want to use ? (1/2/...)"
read k

domain="github.com-${names[$((k-1))]}"

url=$(git remote -v | tr '\t' ' ' | tr '\n' ' ' | awk '{print $2}')
url=$(echo $url | sed -e "s/\@\(.*\)\:/\@${domain}\:/")

echo "Setting origin to $url"
$(git remote rm origin)
$(git remote add origin $url)
$(git remote set-url origin $url)
