url=$1

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

url=$(echo $url | sed -e "s/\@\(.*\)\:/\@${domain}\:/")

$(git clone $url)
