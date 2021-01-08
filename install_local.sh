echo "This script will setup a local development environment for working on the SODA Foundation documentation."
echo "Please select the operating system that you are working on."
echo "1. Ubuntu 16.04 / 18.04"
echo "2. CentOS / RHEL"

# Accept the OS from the user.
read -p "Please enter :" os
if [ os ];
then
        export DEV_OS=$os;
        echo "Selected OS:" $DEV_OS;
fi

if [ $os = '1' ]
then
    printf "Your OS:"
    sudo lsb_release -a
    dpkg -l "hugo" &> /dev/null

    if [ $? = '0' ]
    then 
        printf "Hugo is installed \n"
        hugo version
    elif [ $? = '1' ]
    then
        printf "Hugo is not installed \n"
        printf "Downloading hugo_0.55.6_Linux-64bit.deb ... \n"
        curl --progress-bar --remote-name --location https://github.com/gohugoio/hugo/releases/download/v0.55.6/hugo_0.55.6_Linux-64bit.deb
        printf "Download complete. \n"
        printf "Unpacking... \n"
        sudo dpkg -i hugo_0.55.6_Linux-64bit.deb &> /dev/null
        printf "Unpacking complete. \n"
        printf "Installing Hugo... \n"
        sudo apt-get install -f &> /dev/null
        printf "Installation complete. \n"
        hugo version
        printf "Cleaning up...\n"
        printf "Deleting hugo_0.55.6_Linux-64bit.deb ... \n"
        rm hugo_0.55.6_Linux-64bit.deb*
        printf "Clean up complete. \n"
        printf "\n\n"
    fi

    target="themes/hugo-theme-learn"
    if find "$target" -mindepth 1 -print -quit 2>/dev/null | grep -q .; then
        echo "Learn theme is already setup. \n"
        printf "You can run \'sudo hugo serve \' to start the local server. \n"
    else
        echo "'$target' is empty or not a directory \n"
        printf "Learn theme is not initiated. \n"
        printf "Initiating the Learn Theme... \n"
        git submodule update --init --recursive &> /dev/null
        printf "Learn theme initiated. \n"
        printf "You can run \'sudo hugo serve \' to start the local server. \n"
    fi
elif [ $os = '2' ]
then
    sudo yum list --installed | grep redhat-lsb-core &> /dev/null
    if [ $? = '0' ]
    then 
        printf "Your OS: \n"
        lsb_release -a
    elif [ $? = '1' ]
    then
        printf "Getting OS information... \n"
        sudo yum install redhat-lsb-core -y &> /dev/null
        printf "Your OS:\n"
        lsb_release -a
    fi

    target="/usr/local/bin/hugo"
    if find "$target" -mindepth 1 -print -quit 2>/dev/null | grep -q .; then
        printf "Hugo is installed \n"
        hugo version
    else
        printf "Hugo is not installed \n"
        printf "Downloading hugo_0.55.6_Linux-64bit.tar.gz ... \n"
        curl --progress-bar --remote-name --location https://github.com/gohugoio/hugo/releases/download/v0.55.6/hugo_0.55.6_Linux-64bit.tar.gz
        printf "Download complete. \n"
        printf "Unpacking and installing... \n"
        sudo tar -C /usr/local/bin/ -xvzf hugo_0.55.6_Linux-64bit.tar.gz &> /dev/null
        printf "Unpack Hugo complete. \n"
        printf "Installing Hugo complete. \n"
        hugo version
        printf "Cleaning up...\n"
        printf "Deleting hugo_0.55.6_Linux-64bit.tar.gz ... \n"
        rm hugo_0.55.6_Linux-64bit.tar.gz*
        printf "Clean up complete. \n"
        printf "\n\n"
    fi
    target="themes/hugo-theme-learn"
    if find "$target" -mindepth 1 -print -quit 2>/dev/null | grep -q .; then
        echo "Learn theme is already setup. \n"
        printf "You can run \'hugo serve \' to start the local server. \n"
    else
        echo "'$target' is empty or not a directory \n"
        printf "Learn theme is not initiated. \n"
        printf "Initiating the Learn Theme... \n"
        git submodule update --init --recursive &> /dev/null
        printf "Learn theme initiated. \n"
        printf "You can run \'hugo serve \' to start the local server. \n"
    fi
fi
