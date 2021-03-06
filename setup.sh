#!/bin/sh
#
# Sets up the dotfiles environment by creating the necessary symlinks

info()
{
    echo "\033[32m\033[1m[*]\033[0m $1"
}

warn()
{
    echo "\033[31m\033[1mWARNING:\033[0m \033[33m$1\033[0m"
}

confirm() 
{
    while true; do
        read -p " $1(Yy/Nn) " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "\033[31mPlease answer y/n\033[0m";;
        esac
    done
}

check_dir_exists()
{
    if [ -d $1 ]; then
        warn "directory $1 already exists!"
        if ( confirm "Save contents of old $1 to $1_old?" ); then
            mv $1 $1_old
        else
            rm -rf $1
        fi
    fi
}

check_file_exists()
{
    if [ -f $1 ]; then
        warn "file $1 already exists!"
        if ( confirm "Save contents of old $1 to $1_old?" ); then
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
    info "Setting up vim configuration"
    
    check_dir_exists ~/.vim
    ln -s $PWD/vim ~/.vim
    
    check_file_exists ~/.vimrc
    ln -s $PWD/vimrc ~/.vimrc
}

setup_bash()
{
    info "Setting up bash configuration"

    check_file_exists ~/.bashrc
    ln -s $PWD/bash/bashrc ~/.bashrc

    check_file_exists ~/.bash_profile
    ln -s $PWD/bash/bash_profile ~/.bash_profile

    check_file_exists ~/.inputrc
    ln -s $PWD/bash/inputrc ~/.inputrc
}

setup_zsh()
{
    info "Setting up zsh configuration"
    
    check_file_exists ~/.zshrc
    ln -s $PWD/zsh/zshrc ~/.zshrc

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    ln -s $PWD/zsh/powerlevel10k/powerlevel10k.zsh-theme ~/.oh-my-zsh/themes/powerlevel10k.zsh-theme
    ln -s $PWD/zsh/p10k.zsh ~/.p10k.zsh
}

setup_screen()
{
    info "Setting up screen configuration"
    
    check_file_exists ~/.screenrc
    ln -s $PWD/screen/screenrc ~/.screenrc
}

post_setup()
{
    echo "Please view README.md for post-install additional downloads."
}

main()
{
    if ( ! meets_prereqs ); then
        warn "setup.sh needs to be run in the dotfiles/ repository directory"
        exit
    fi

    setup_vim
    setup_bash
    setup_zsh
    setup_screen

    post_setup
}

main
