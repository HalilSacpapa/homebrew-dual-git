#! /bin/bash

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
elif [[ $1 == "--help" ]]; then
    echo -e "dgit is a script that allow basic multiple ssh usage, linked to differents github accounts.\n"
    echo -e "Available commands:"
    echo -e "setup\n\tCreate two ssh keys for your github accounts, setup the ssh config file and the environment configuration.\n\t\tUsage: dgit setup\n"
    echo -e "set-origin\n\tSet the origin of an already cloned git repository to the desired ssh key.\n\t\tUsage (inside a repository): dgit set-origin\n"
    echo -e "clone\n\tClone a git repository using the desired ssh key.\n\t\tUsage: dgit clone <repository-url>\n"
else
    echo "Usage: dgit <arg>\n\tavailable args: setup, set-origin, clone, --help"
    exit 1
fi
exit 0
