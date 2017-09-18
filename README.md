Rainbow bash!
=============

Better bash prompt! you don't need zsh for cool prompts.

**Table of Contents**

- [Introduction](#introduction)
- [Preparation](#preparation)
  - [System locale](#system-locale)
  - [Unicode terminal](#unicode-terminal)
  - [Font and glyphs](#font-and-glyphs)
- [Installation](#installation)
- [Themes](#themes)
- [Custom themes](#custom-themes)
- [Plugins](#plugins)


Introduction
------------

Do you think this is zsh?

![rainbow-bash-simple](/themes/simple/snapshot.png?raw=true)

or this?

![rainbow-bash](/snapshots/rainbow-bash.png?raw=true)


Nope! is bash with rainbow bash \o/


DISCLAIMER: I only use GNU/Linux, I haven't tested on Mac

Preparation
-----------

### System locale

We are going to use unicode for the glyphs, you can check if your system is
already configured:

    $ locale

    LANG=es_ES.UTF-8
    LC_CTYPE=es_ES.UTF-8
    LC_NUMERIC=es_ES.UTF-8
    LC_TIME=es_ES.UTF-8
    LC_COLLATE=es_ES.UTF-8
    LC_MONETARY=es_ES.UTF-8
    LC_MESSAGES=es_ES.UTF-8
    LC_PAPER=es_ES.UTF-8
    LC_NAME=es_ES.UTF-8
    LC_ADDRESS=es_ES.UTF-8
    LC_TELEPHONE=es_ES.UTF-8
    LC_MEASUREMENT=es_ES.UTF-8
    LC_IDENTIFICATION=es_ES.UTF-8
    LC_ALL=


If not, check your distro manual, for example

* [Arch](https://wiki.archlinux.org/index.php/Locale)
* [Ubuntu](https://help.ubuntu.com/community/Locale)


### Unicode terminal

You can use konsole, terminator...

You are thinking... I love [urxvt](http://software.schmorp.de/pkg/rxvt-unicode.html)!
You can use urxvt, but it has problems with [fontconfig](http://www.freedesktop.org/wiki/Software/fontconfig/) and we are going to use it in the future, so don't use urxvt please :)

don't be sad, I have the answer if you like urxvt, use the new and promising [termite](https://github.com/thestinger/termite)

we are almost ready


### Font and glyphs

I pass a lot of hours in front of the terminal, I bet you too, we need to put
a fancy and easy to read font, I personally like [Source code pro](http://adobe-fonts.github.io/source-code-pro/) from Adobe
(don't let Adobe word afraid you, its free as in freedom, thanks Adobe!) but
you can use [Inconsolata](http://levien.com/type/myfonts/inconsolata.html) or others, Download and install it:

    wget https://github.com/adobe-fonts/source-code-pro/archive/1.017R.zip
    unzip 1.017R.zip
    mkdir -p ~/.fonts
    cp source-code-pro-1.017R/OTF/*.otf ~/.fonts/
    fc-cache -f -v

Configure your terminal to use Source Code pro, for example in termite should be:

    font = Source Code Pro 11

Do you like fancy icons? yup, me too :) we are going to setup [font awesome](http://fortawesome.github.io/Font-Awesome/) and
[powerline icons](https://github.com/powerline/powerline), but you can set a lot more fonts like [octicons](https://octicons.github.com/),
so is up to you to set up more.

The explanation is easy, when an unicode glyph is needit, for example the
`\uf17c` character (tux icon in fontawesome) will be checked in the default
font (Source code pro in our case) and if is not found then will fallback to
the ones that we have configure (fontawesome and powerline).

So, install the fonts:

    wget http://fortawesome.github.io/Font-Awesome/assets/font-awesome-4.2.0.zip
    unzip font-awesome-4.2.0.zip
    cp font-awesome-4.2.0/fonts/FontAwesome.otf ~/.fonts/
    wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf -O /home/slok/.fonts/PowerlineSymbols.otf
    fc-cache -f -v

And configure our fallbacks for `source code pro`, for this create a file in:
`$HOME/fontconfig/conf.d/10-fallback.conf` with the fallbacks:

    <?xml version="1.0"?>
    <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
    <!-- fallback fonts when a glyph is not found in the current font-->

    <fontconfig>
      <alias>
        <family>Source Code Pro</family>
        <prefer>
          <family>FontAwesome</family>
          <family>PowerlineSymbols</family>
        </prefer>
      </alias>
    </fontconfig>

we are ready for rainbow bash! first, we are going to check if this works, close your
terminal session and open a new one and check it with:

    python -c "print(''.join([chr(i) + '\u0020\u0020'  for i in range(61440, 61440 + 525)]))"

and:

    python -c "print('\u2588\ue0a0\ue0a1\ue0a2\ue0b0\ue0b1\ue0b2\ue0b3')"

You should see something like this:

![fontawesome on terminal](/snapshots/font-awesome.png?raw=true)


Installation
------------
Note: There's a bashscript that automates the installation of the fonts and rainbow bash [here](https://gist.github.com/elegos/f426eda926f39fab081fe5b390b33544), if you want the manual steps
instead continue reading.

Install Rainbow bash:

    $ git clone https://github.com/slok/rainbow-bash.git $HOME/.rainbow-bash

Add this to you `.bashrc`:

    # Prompt
    RBW_PATH=$HOME/.rainbow-bash
    source $RBW_PATH/init.sh
    rbw_load_theme simple

you can change `rbw_load_theme simple` with any of the described themes


Themes
------

[Go to themes](/themes)

Custom themes
-------------

You can make custom themes is easy, rainbow bash gives you colors and
plugins.

Check each plugin folder to check which functions and variables gives you.

[And default themes](/themes)


Plugins
-------

* [Position: Terminal cursor position utils](/plugins/position)
* [Git: Git utils](/plugins/git)
* [System: system common utils](/plugins/system)
* [strings: string formating utils](/plugins/strings)
* [Kubernetes: get context](/plugins/kubernetes)
