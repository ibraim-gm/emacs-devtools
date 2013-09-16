## About

**Important:** This setup is *requires* emacs 24+. It also relies heavily on the
amazing [el-get](https://github.com/dimitri/el-get) to download and synchronize
packages. I use this setup daily on linux, and sometimes on
Windows. If you're planning on using Windows you should
[take a look on the Windows-specific instructions](https://github.com/ibraim-gm/emacs-devtools/blob/master/WINDOWS.md) too.

`emacs-devtools` is pre-configured collection of emacs files to make the live of
a developer easy.  Originally my intent was to use emacs only to learn Lisp, but
soon I find myself using more and more emacs every day. Suddenly, I
realized that I had a bunch of customizations and utilities that could be very
useful, mainly for emacs beginners.

The next step was obvious: I cleaned and reorganized my configuration to make
everything easier to understand and created this project in 2012. This is a
major rewrite of the project, now requiring emacs 24+ that use the new package
management mechanism to make things easier to configure and maintain. My hope is
that this project serve as a starting point (or at least as a source of ideas)
for your own personal emacs configuration.

The best part: it's *fully functional* in both Linux and Windows!

**Windows Users**: This setup is tested regularly on Windows ans should work
flawlessly, and without any additional software or configuration. If you find any
problem, please take a look at the
[older, deprecated Windows-specific instructions](https://github.com/ibraim-gm/emacs-devtools/blob/master/OLD_WINDOWS.md)
and/or file a bug on [GitHub](https://github.com/ibraim-gm/emacs-devtools).

## Install

    git clone https://github.com/ibraim-gm/emacs-devtools.git ~/.emacs.d
    cp ~/.emacs.d/samples/sample-.emacs ~/.emacs
    cp ~/.emacs.d/samples/sample-.emacs-custom ~/.emacs-custom
    cp ~/.emacs.d/samples/sample-.gnus.el ~/.gnus.el (Only if you intend to use gnus)

Now, open the `.emacs` and follow the comments to configure what you
need. Remember that when you start emacs for the first time or when you enable a
new feature and restart emacs, it may take a while to donwload the required
packages and byte-compile them (the compilation buffer may be also show in this
process). Most packages can be used right after being downloaded, but some of
then (notably, ECB) requires that you reopen your emacs to see the changes.

## Features

Note that **all features are disabled by default**. To enable them, you need to
edit you newly-copied `.emacs` and uncomment teh desired sections.  The
"requires" text of each feature is only informative: everything is installed
automagically as long as you have an active internet connection.

### `general` (requires [eshell](http://www.gnu.org/software/emacs/manual/html_node/eshell) and [column-marker](http://emacswiki.org/emacs/column-marker.el))

*    Change the font to *DeJa Vu Sans Mono*.
*    Do not show the startup screen and the startup message.
*    Removes the toolbar and sets the scrollbar to the right side of the screen.
*    Show column and line numbers on buffers.
*    Show trailing whitespaces in red.
*    When saving a buffer, ensure a newline exists at the end of file and remove all trailing whitespace.
*    Always enable `transient-mark` and always shows the current line highlighted.
*    By default, change indentation to 2 spaces. No tabs allowed.
*    When doing a search, highligh the terms in buffer.
*    Enable the use of the mouse wheel.
*    Change `yes` and `no` questions on emacs for `y` or `n`.
*    Set the `fill-column` to 80.
*    Enables [IDO mode](http://emacswiki.org/emacs/InteractivelyDoThings).
*    Force emacs to use a single directory (`~/.emacs.d/backups`) to save its backup files, instead of scattering them all around.
*    Minor (cosmetic) improvements on `dired` and `ediff` modes.
*    Start a (e)shell inside emacs when you press `C-f12`.
*    On MS-Windows, make sure emacs starts maximized.

### `colors` (requires [color-theme-solarized](https://github.com/sellout/emacs-color-theme-solarized))

*    Enables the *solarized dark* color-theme.
*    On `lisp-mode`, add some extra regular expressions to colorize.

### `ac` (requires [auto-complete](https://github.com/auto-complete/auto-complete))

Enables the amazing auto-complete mode on nearly anything. Some of the default
colors os the popup window are changed to look a bit better with the solarized
theme.

### `ide` (requires [CEDET](http://cedet.sourceforge.net/), [ECB](http://ecb.sourceforge.net/), [EScreen](http://www.emacswiki.org/emacs/EmacsScreen) and [rainbow-delimiters](https://github.com/jlr/rainbow-delimiters))

*    Enable EDE and the most useful semantic modes.
*    Enable the use of rainbow delimiters on *all* programming languages.
*    `f9` will (de)activate ECB and it's IDE-like layout. The `samples/sample-.emacs-custom` file contain a pre-configured layout.
*    `f11` runs `other-window`. Very useful to switch between code and compilation/error windows.
*    `f4` will prompt you a directory and a regexp to do a grep search of files.
*    `M-fN` will switch to a different 'screen' inside emacs and remember in wich window ECB was activated. You can, for example, `f9` and start working on a project,
     then `M-f2` and start a shell and then `M-f3` to do something else, etc. Note that only one screen is able to remember ECB activation; if you switch screens and
     reactivate ECB, the last activation will be forgotten.

### `lang-cucumber` (requires [feature-mode](https://github.com/michaelklishin/cucumber.el))

Enables highlighting for [Gherkin](https://github.com/cucumber/gherkin) user stories.

### `lang-latex` (requires [auctex](http://www.gnu.org/software/auctex/) and, obviously, a working latex installation.)

*    When working on latex files, activate `fill-mode` and set compilation options to view/generate PDF files.
*    `C-c C-c` will compile the current latex file. If the file is already compiled a prompt to open the file will be show.
*    `C-c C-l` will preview the output file.

### `lang-clojure` (requires [clojure-mode](https://github.com/technomancy/clojure-mode) and [nrepl](https://github.com/kingtim/nrepl.el))

*    Enable useful modes, like rainbow and eldoc when using nrepl.
*    Auto-indent on new line.
*    `f5` when in `clojure-mode` starts a nrepl instance with the current leiningen project loaded.

### `lang-php` (requires [php-mode](http://emacswiki.org/emacs/PhpMode))

Auto-indent on new line. It also identify a broader range of files as "php".

### `lang-c`

*    Sets the default formatting style to `"linux"`.
*    Sets the default indent offset to 2 spaces.
*    Auto-indent on a new line.

### `lang-haskell` (requires [haskell-mode](https://github.com/haskell/haskell-mode))

*    Both `<return>` and `C-<return>` offer different indentation mechanisms.
*    `C-c C-l` and `f5` load the current file on the haskell process. If no process exists, a new one is created.
*    `C-c C-z` switch to the haskell repl buffer.
*    `C-c C-c` calls the "cabal build" process on the opened project.
*    `C-c c` prompts the user for a Cabal command to run.
*    `C-c C-t` calls `:type` in the current identifier.
*    `C-C C-i` calls `:info` in the current identifier.
*    The cabal build shortcuts work on `.cabal` files too.

### `lang-markdown` (requires [markdown-mode](http://jblevins.org/projects/markdown-mode/) and markdown installed)

*    `C-c C-c m` compiles the current markdown buffer and show the HTML output on another buffer.
*    `C-c C-c p` compiles the current markdown buffer and open the results in browser.
*    `C-c C-c e` compiles the current file and generates a `.html` with the results.
*    `C-c C-c v` same as the previous command, but also show the result file on browser.
*    `C-c C-c w` compiles the file and put the results on the kill ring.
*    You can see the full list of features in [the official markdown-mode page](http://jblevins.org/projects/markdown-mode/).

## Maintaining

If you want to use `emacs-devtools` as a starting point to your personal
configuration, my personal recommendation is to **fork** this project for a
private repository and change/add/remove what you want in the fork. This way,
you can have a "backup" of your personal options AND will be able to fetch any
new features or bug fixes from the original project.

## Old emacs?

If you insist on using an old version of emacs, you can try to use the "old" code.
Take a look at the tag `before-el-get`.

## License

BSD-3. Take a look at `LICENSE` and `AUTHORS` for more details.
