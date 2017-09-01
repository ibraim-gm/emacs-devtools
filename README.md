# Emacs Devtools #

## About

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

First of all, make sure you do not have a `.emacs` file in your home. Then, just clone
the repository in `~.emacs.d`:

    git clone https://github.com/ibraim-gm/emacs-devtools.git ~/.emacs.d

Now, start emacs and execute `M-x dt-install`. This will download and install all
packages, and generate a new `.emacs` file in your home directory. After restarting
emacs, devtools will be installed and configured.

**Windows Only**: If you have errors when trying to donwload the packages, try
running emacs from inside a git terminal. After installing successfully, you can
run emacs from outside the git terminal too.

## Features

A lot of the features work seamlessly integrated in your editing (ex: smart parens, rainbow
parens, ivy, auto completion, etc.) but some of them have additional commands bound by default.

When in doubt, you can check `lisp/completion-init.el` for general goodies; while `lisp/lang-init.el`
have language-specific configurations and extra bindings. Don't be shy!

### Querying for help ###

To help you learn the new features, you can try `C-?` to show a list of generic, but useful
commands. Also, typing `M-x` will show the available commands/keys if you wait a little.

### Resizing and moving between windows ###

You can easy move between existing frames with `M-<arrow>`. To enlarge or shrink a frame, you
can use `C-S-<arrow>`.

### Layouts ###

You can easily create and load custom frame layouts. Just use `C-c l l` to load or `C-c l s`
to save. You can toggle window dedication with `<f11>`.

### Magit and speedbar ###

You can have the power of magit with `C-x g`. Also, `<f8>` toggles a handy speedbar, that automatically
integrates with your projectile projects.

Note that **all features are disabled by default**. To enable them, you need to
edit you newly-copied `.emacs` and uncomment teh desired sections.  The
"requires" text of each feature is only informative: everything is installed
automagically as long as you have an active internet connection.

## Maintaining

If you want to use `emacs-devtools` as a starting point to your personal
configuration, my personal recommendation is to **fork** this project for a
private repository and change/add/remove what you want in the fork. This way,
you can have a "backup" of your personal options AND will be able to fetch any
new features or bug fixes from the original project.

Note that the packages are all *pinned*. If you want to use different versions,
you can unpin (or put a specific version), and run `M-x dt-install-packages` to
get the new version. You might want to use `M-x quelpa-self-upgrade` too.

## Old emacs?

If you insist on using an old version of emacs, you can try to use the (*very*)
"old" code. Take a look at the tag `before-el-get`.

## License

BSD-3. Take a look at `LICENSE` and `AUTHORS` for more details.
