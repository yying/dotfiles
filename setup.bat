@ECHO OFF
REM This is mostly untested for the moment

IF NOT EXIST setup.sh GOTO BadPath
IF NOT EXIST setup.bat GOTO BadPath

IF EXIST %USERPROFILE%\_vimrc CALL :PromptVimrc
IF EXIST %USERPROFILE%\vimfiles CALL :PromptVimfiles

CALL :VimrcSymlink
CALL :VimfilesSymlink
GOTO :EOF

:PromptVimrc
SET YN=
SET /P YN=" Delete old vimrc? Y/N (Default:Y) "
IF NOT "%YN%" == "N" GOTO DeleteVimrc
COPY /Y %USERPROFILE%\_vimrc %USERPROFILE%\_vimrc_old
:DeleteVimrc
DEL %USERPROFILE%\_vimrc
GOTO :EOF

:PromptVimfiles
SET YN=
SET /P YN=" Delete old vimfiles? Y/N (Default:Y) "
IF NOT "%YN%" == "N" GOTO DeleteVimfiles
COPY /Y %USERPROFILE%\vimfiles %USERPROFILE%\vimfiles_old
:DeleteVimfiles
RMDIR /Q /S %USERPROFILE%\vimfiles
GOTO :EOF

:VimrcSymlink
SET ERRORLEVEL=
MKLINK %USERPROFILE%\_vimrc %cd%\vimrc
IF ERRORLEVEL 9009 GOTO MklinkNotFound
GOTO :EOF

:VimfilesSymlink
SET ERRORLEVEL=
MKLINK /D %USERPROFILE%\vimfiles %cd%\vim
IF ERRORLEVEL 9009 GOTO MklinkNotFound
GOTO :EOF

:MklinkNotFound
ECHO WARNING: mklink.exe not found in PATH!
ECHO Please mklink.exe to PATH
GOTO :EOF

:BadPath
ECHO WARNING: setup.bat should be run in the dotfiles\ root directory!
GOTO :EOF
