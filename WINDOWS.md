## Windows Notes
As usual, Windows sucks and you shouldn't be using it for anything remotely
serious. However, there are times when you're **forced** to use this flawed OS
for some specific reason (school, work, etc.) and you just have to deal with it.

Luckily for you, *Emacs DevTools* works on Windows. (yay!)

To make things work on Windows, you should keep in my that we need to fix a few
things first:

1.    We need [Git](http://git-scm.com/download) and [GNU Make](http://gnuwin32.sourceforge.net/packages/make.htm).
1.    We need to put emacs *inside* our git environment and fix the location of
      our home directory.
1.    We should download/install miscellaneous packages (MikTex for latex support,
      leiningen for Clojure, etc.)

Let's walk through each of these steps now.

### Installing Emacs, Git and GNU Make

First of all get
[Git for Windows](http://code.google.com/p/msysgit/downloads/list) (I personally
prefer the portable version) and install/extract preferably to a location
without spaces (ex: `C:\PortableGit`). Use the `git-bash.bat` file and make sure
git is working as intended.

Now, get [GNU Make](http://gnuwin32.sourceforge.net/packages/make.htm) and
install it in a location without spaces (ex: `C:\GNUWin32`). Add the `bin`
directory of this folder on your `PATH` environment variable. To test, open a
new `cmd.exe` instance and try to run `make --version`. Do the same, this time
on a new `git-bash` window.

Last, but not least, it's time to get [Emacs for Windows](http://ftp.gnu.org/gnu/emacs/windows)
(make sure you get version 24 or higher and the "bin" package). Extract it
**inside** your portable git folder. In my case, I decided to put it into a
emacs folder inside the share directory, so now I have emacs on `C:\PortableGit\share\emacs24.2`.
On `C:\PortableGit\bin`, create a new file `emacs` (without extension) with the
following content:

    #!/bin/sh
    /share/emacs24.2/bin/emacs.exe "$@"

To test, type `emacs` on `git-bash` and a new instance of emacs should be
opened.

### Fixing the HOME directory and testing the setup

Depending on "where" (Windows or Git shell) you run emacs, it will get a
*different* home directory. To fix that, modify/create the `HOME` environment
variable on Windows to something of your liking (in my case `C:\Documents and
Settings\my.username`). Remember to reopen your shell to get the changes
applied!

Finally, the fun part: clone this repository to `~/.emacs.d`, copy the sample
file to `~/.emacs` and, without changing anything, run emacs **inside**
`git-bash`. It should automatically download and install
[el-get](https://github.com/dimitri/el-get). For now on, if you want to
**install or upgrade** any package you **must** start emacs from `git-bash`; if
only want to use emacs, you can start from `git-bash` or directly by Windows,
using the *runemacs.exe* file.

Congratulations! You can now customize your new emacs environment to your
liking!

### Extra steps

There are the extra steps required to use some of the packages under Windows.

#### Latex

Install [MikTeX](http://miktex.org/download) in a folder without spaces. Add the
`miktex\bin` directory to your `PATH` variable, ex:
`C:\MiKTeX 2.9\miktex\bin`. Try running `pdflatex --version` on your command
prompt, if it works you're good to go.

#### Clojure/Leiningen

Install Leiningen
[using the bat file](https://raw.github.com/technomancy/leiningen/stable/bin/lein.bat). Add
the directory where the bat file is to your `PATH` and run `lein --version`. If
it works, you're good to go. Bear in mind that leiningen will *only works on a
Windows environment*, it **cannot** run inside your `git-bash`, so if you start
emacs from there, it simply won't work.
