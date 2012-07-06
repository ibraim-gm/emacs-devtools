## About

**Important:** This setup is tested on emacs 24+ on Linux. Running on Windows or using different versions of emacs *may* work, but I'm not really sure.

`emacs-devtools` is pre-configured collection of emacs files to make the live of a lisp developer easy.
Originally my intent was to use emacs only to learn Lisp, but soon I find myself using more and more emacs every day. Suddenly, I realized that I had a bunch of customizations and utilities that could be very useful, mainly for emacs beginners.

The next step was obvious: I cleaned and reorganized my configuration to make everything easier to understand and created this project. My hope is that this project serve as a starting point (or at least as a source of ideas) for your own personal emacs configuration.

## What to expect

If you enable everything, you will have:

* A custom (dark) color theme for your emacs. I find it much easier on the eyes than the standard white background.
* Auto-complete (aka "Intellisense") support for Common Lisp and Clojure. You can implement/enable this functionality for other languages as well.
* Default configurations for latex use (requires [AUCTex](http://www.gnu.org/software/auctex/)).
* Support for multiple "environments" inside your emacs.
* IDE-like display of your buffers, with customizable layout.
* An example of using Gnus with GMail.

Keep in mind that I'm **NOT** the author of most of the functionality: I only use the existing emacs libraries and package them together.

## Install

        git clone https://bitbucket.org/ibraim/emacs-devtools.git ~/.emacs.d
        cp ~/.emacs.d/samples/sample-.emacs ~/.emacs
        cp ~/.emacs.d/samples/sample-.emacs-custom ~/.emacs-custom
        cp ~/.emacs.d/samples/sample-.gnus.el ~/.gnus.el

Now, open the `.emacs` and follow the comments to configure what you need. If you want to use Gnus with GMail, don't forget to edit the `.gnus.el` file.
If you use the IDE support or Gnus with BBDB, you should byte-compile it for faster startup times:

        cd ~/.emacs.d/packages/cedet-1.1
        make
        cd ~/.emacs.d/packages/ecb-2.40
        make
        cd ~/.emacs.d/packages/bbdb-2.35
        ./configure
        make

## Quick-and-dirty tutorial

* You will probably want to change the font face or size. This can be done in `custom/general.el`.
* By default, all backup files generated by emacs will be located in `.emacs.d/backups`.
* `C-f12` opens a shell (sh) buffer.
* Latex mode will use pdflatex by default. Use `C-c C-c` to compile and `C-c C-v` to view.
* `f9` will enable/disable the IDE layout. Note that you can change your layout using the "Customize" option of emacs later.
* `f5` will start the lisp (or clojure) repl. Take a look at `custom/lang-sbcl.el` or `custom/lang-clojure.el` for details. Note that clojure support depends on [Leiningen](http://leiningen.org/) to work.
* `M-fN` will switch to the Nth environment. Only one environment can use the IDE layout.
* In Gnus, `M-x bbdb-create` will create add a new contact to the database. Then, when editing mail, `TAB` will complete email addresses based on the contacts of the database.

## Maintaining

If you want to use `emacs-devtools` as a starting point to your personal configuration, my personal recommendation is to **fork** this project for a private repository and change/add/remove want you want in the fork. This way, you can have a "backup" of your personal options AND will be able to fetch any new features or bug fixes from the original project.

## License

BSD. Take a look at `LICENSE` and `AUTHORS` for more details.
