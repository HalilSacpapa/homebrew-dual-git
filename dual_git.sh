if [[ $1 == "setup" ]]; then
    exec ~/.dual_git/setup_dual_ssh.sh
elif [[ $1 == "set-origin" ]]; then
    exec ~/.dual_git/manage_repo_origin.sh
elif [[ $1 == "clone" ]]; then
    if [ $# -ne 2 ]; then
        echo "Usage: dgit clone <repo-ssh-url>"
        exit 1
    fi
    exec ~/.dual_git/setup_clone_ssh.sh $2
else
    echo "Usage: dgit <arg>\n\targs: setup, set-origin, clone"
    exit 1
fi
