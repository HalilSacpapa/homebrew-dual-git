echo "This script will create two ssh keys for your github accounts.\nWould you like to proceed? (y/n)"
read response

if [ response == "n" ]; then
    exit 1
fi

echo "\nEnter the email adress of your first account:"
read email1
echo "Enter the name of your first account:"
read name1

echo "\nEnter the email adress of your second account:"
read email2
echo "Enter the name of your second account:"
read name2


echo "the following ssh keys will be created:\n\t$email1 (~/.ssh/$name1.pub)\n\t$email2 (~/.ssh/$name2.pub)\n\nWould you like to proceed? (y/n)"
read response

if [ response == "n" ]; then
    exit 1
fi

echo "\n\n"
ssh-keygen -t rsa -b 4096 -C "$email1" -f ~/.ssh/$name1
echo "\n\n"
ssh-keygen -t rsa -b 4096 -C "$email2" -f ~/.ssh/$name2
echo "\n\nssh keys successfully created to the ~/.ssh directory.\n\n"

echo "Copying $name1 ssh keys to clipboard...\n"
$(pbcopy < ~/.ssh/$name1.pub)
echo "You can now paste the key into your $email1 github account settings.\nhttps://github.com/settings/ssh/new\nConfigure SSO if necessary.\n"
echo "Press enter to continue...\n\n"
read cb

echo "Copying $name2 ssh keys to clipboard...\n"
$(pbcopy < ~/.ssh/$name2.pub)
echo "You can now paste the key into your $email2 github account settings.\nhttps://github.com/settings/ssh/new\nConfigure SSO if necessary.\n"
echo "Press enter to continue...\n\n"
read cb

echo "Which account would you like to use by default?\n\t1. $name1 ($email1)\n\t2. $name2 ($email2)"
read response

echo "We will setup the ssh config file located at ~/.ssh/config.\n"
domain1="github.com-$name1"
domain2="github.com-$name2"
echo "Host $domain1\n\tHostName github.com\n\tUser git\n\tIdentityFile ~/.ssh/$name1\n\nHost $domain2\n\tHostName github.com\n\tUser git\n\tIdentityFile ~/.ssh/$name2" >> ~/.ssh/config

if [ $response == "1" ]; then
    echo "\nUsing $name1 with $email1 by default."
    $(git config --global user.name "$name1")
    $(git config --global user.email $email1)
elif [ $response == "2" ]; then
    echo "\nUsing $name2 with $email2 by default."
    $(git config --global user.name "$name2")
    $(git config --global user.email $email2)
fi
