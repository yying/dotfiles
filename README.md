Installation
------------
On Linux/Mac OS X/FreeBSD, executing `setup.sh` should setup all the symlinks correctly for bash, screen, and vim.

On Windows, executing `setup.bat` should setup NTFS "symlinks" for Vim configuration files.

Post-Install Additional Downloads
---------------------------------
[Tagbar](https://github.com/majutsushi/tagbar) requires exuberant ctags in order to function. Download exuberant ctags for Windows/Linux [here](http://ctags.sourceforge.net/).

[Syntastic](https://raw.github.com/scrooloose/syntastic) support for JavaScript depends on several external JavaScript validation tools. I've had good success using [JSHint](https://github.com/jshint/jshint/). The easiest way to install is to install [node.js](http://nodejs.org/) and typing `npm install -g jshint`.

Windows Specific Downloads
--------------------------
TODO: Need to find a good Windows specific C syntax checker for Syntastic.

Mac OS X Specific Downloads
---------------------------
It is recommended that [MacVim](https://github.com/b4winckler/macvim) be used on Mac OS X for more comprehensive Python/Ruby omnicomplete support. 

Precompiled MacVim binaries can be found [here](https://code.google.com/p/macvim/downloads/list)

I recommend the following sequence of commands for installing MacVim (make sure you move `mvim` from MacVim install to `/usr/local/bin/mvim` first)

    sudo rm /usr/bin/vi
    sudo mv /usr/bin/vim /usr/bin/vi
    sudo ln -s /usr/local/bin/mvim /usr/bin/vim
    sudo ln -s /usr/local/bin/mvim /usr/bin/gvim

If you happen to actually use Vim by calling `vi`, you can replace `/usr/bin/vi` with `/usr/bin/vim_old`.

Mac OS X Post-Install Optional Settings
---------------------------------------
__Terminal.app__
The default keymappings for `PageUp` and `PageDown` should be the following:

    Home:     \033[1~
    End:      \033[4~
    PageUp:   \033[5~
    PageDown: \033[6~


