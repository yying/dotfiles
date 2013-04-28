#!/bin/sh
#
# Sets up the dotfiles environment by creating the necessary symlinks

confirm() 
{
    while true; do
        read -p "$1 " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Please answer y/n.";;
        esac
    done
}

check_dir_exists()
{
    if [ -d $1 ]; then
        echo "  WARNING: directory $1 already exists!"
        if ( confirm "  Save contents of old $1 to $1_old?" ); then
            mv $1 $1_old
        else
            rm -rf $1
        fi
    fi
}

check_file_exists()
{
    if [ -f $1 ]; then
        echo "  WARNING: file $1 already exists!"
        if ( confirm "  Save contents of old $1 to $1_old?" ); then
            mv $1 $1_old
        else
            rm -rf $1
        fi
    fi
}

meets_prereqs()
{
    if [ ! -f $PWD/setup.sh ]; then
        return 1
    fi
    
    if [ ! -f $PWD/setup.bat ]; then
        return 1
    fi
    
    return 0
}

setup_vim()
{
    echo "[*] Setting up vim configuration"
    
    check_dir_exists ~/.vim
    ln -s $PWD/vim ~/.vim
    
    check_file_exists ~/.vimrc
    ln -s $PWD/vimrc ~/.vimrc
}

setup_bash()
{
    echo "[*] Setting up bash configuration"

    check_file_exists ~/.bashrc
    ln -s $PWD/bash/bashrc ~/.bashrc

    check_file_exists ~/.bash_profile
    ln -s $PWD/bash/bash_profile ~/.bash_profile

    check_file_exists ~/.inputrc
    ln -s $PWD/bash/inputrc ~/.inputrc
}

setup_screen()
{
    echo "[*] Setting up screen configuration"
    
    check_file_exists ~/.screenrc
    ln -s $PWD/screen/screenrc ~/.screenrc
}

main()
{
    if ( ! meets_prereqs ); then
        echo "WARNING: setup.sh needs to be run in the dotfiles/ repository directory"
        exit
    fi

    setup_vim
    setup_bash
    setup_screen
}

main
