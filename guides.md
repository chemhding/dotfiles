## HomeBrew

`Brew cask` is an extension of `Homebrew`.

Show package info: `Brew info` or `Brew cask info`.

HomeBrew packages are installed in `/usr/local/Cellar/`.

Symlinks for binaries are put in `/usr/local/opt/`.

## Basictex

Use `tlmgr` to install packages: `sudo tlmgl install <name>`.

To show installed packages: `tlmgl list --only-installed`.

To show all packages: `tlmgl list`.

## Java

### Installation

```sh
brew cask install java
```

## Python

### Installation

#### MacOS

Install python and python2 using HomeBrew.

```sh
brew install python python@2
```

Python are installed in `/usr/local/Cellar/python@3.x` via HomeBrew.

Symlinks are created in `/usr/local/bin/` in addition to `/usr/local/opt/`.

To create symlink manually, e.g. `brew link python3`, which will create symbolic link in `/usr/local/bin/python3` that points to `/usr/local/Cellar/python@3.x/3.x.x/bin/python3`.

The message after installation:

> Unversioned symlinks `python`, `python-config`, `pip` etc. pointing to
> `python3`, `python3-config`, `pip3` etc., respectively, have been installed into
> `/usr/local/opt/python@3.x/libexec/bin`

which means to let `python`, `pip` start `python3` and `pip3` (referred from [here](https://stackoverflow.com/a/51912712)):
```
echo 'export "PATH=/usr/local/opt/python@3.x/libexec/bin:$PATH"' >> ~/.zshrc
```

Install Python packages with `pip`:
```
/usr/local/opt/python@3.x/bin/pip3 <package>
```
They will install into the site-package directory
```
/usr/local/bin/python3.x/site-packages
```

To let the installed `python@3.x` first in PATH:
```
echo 'export "PATH=/usr/local/opt/python@3.x/bin:$PATH"' >> ~/.zshrc
```
For compilers to find python@3.x:
```
export LDFLAGS="-L/usr/local/opt/python@3.x/lib"
```
For pkg-config to find python3.x:
```
export PKG_CONFIG_PATH="/usr/local/opt/python@3.x/lib/pkgconfig"
```

Install `virtualenv` & `virtualenvwrapper`
```
python3 -m pip install virtualenv
python3 -m pip install virtualenvwrapper
```
Configuration
```
export WORKON_HOME=$HOME/.virtualenv
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
source /usr/local/bin/virtualenvwrapper.sh
```
During startup, `virtualenvwrapper.sh` finds the first python and `virtualenv` programs on the `$PATH` and remembers them to use later. It is import for the `PATH` to be set **before** sourcing `virtualenvwrapper.sh`.

To override the `$PATH` search, set the variable `VIRTUALENVWRAPPER_PYTHON` to the full path of the interpreter to use and `VIRTUALENVWRAPPER_VIRTUALENV` to the full path of the `virtualenv` binary to use. Both variables must be set before sourcing `virtualenvwrapper.sh`.

Quick-Start

Run `workon` to see a list of environments.

Run `mkvirtualenv temp` to create an environment called `temp`.

Run `workon temp` to enter the environment.

Run `rmvirtualenv temp` to remove.

#### Windows

Try anaconda.

### Issues
- [Matplotlib in virtualenv on MacOS ](#Matplotlib-in-virtualenv-on-MacOS)
- [Jupyter notebook in virtualenv](#Jupyter-notebook-in-virtualenv)
- [Issue with virturalenv after brew upgrade python](#Issue-with-virturalenv-after-brew-upgrade-python)
- [Install graphviz on Windows](#Install-graphviz-on-Windows)

#### Matplotlib in virtualenv on MacOS

Python is not installed as a framework. The Mac OS X backend will not be able to function correctly if Python is not installed as a framework. See the Python documentation for more information on installing Python as a framework on Mac OS X. Please either reinstall Python as a framework, or try one of the other backends. If you are using (Ana)Conda please install python.app and replace the use of 'python' with 'pythonw'. See 'Working with Matplotlib on OSX' in the Matplotlib FAQ for more information
.

Solution found [here](https://stackoverflow.com/a/21789908).

Create file `~/.matplotlib/matplotlibrc` and add line ~~`backend:TkAgg`~~

**Note**

It seems there's some issue with `TkAgg` backend, a blank window pops without any graph on it when calling `matplotlib.pyplot.plot()` function. Problem seems to be related with Apple's `tcl/tk`. Couldn't figure out a solution. So change backend to `backend: Qt5Agg`. `pip install PyQt5` prior to using `Qt5Agg`.

#### Jupyter notebook in virtualenv

To run jupyter notebook in virtual environment, one approach is to have one global jupyter notebook installation, but to point to different kernels to run as the backend.

Assume you have installed jupyter notebook not in a virtualenv. To install on MacOS

```sh
brew install jupyter
```

Enter into virtual environment and install ipykernel
```sh
workon virtualenv-name

pip install ipykernel
```

Install a new kernel
```sh
python -m ipykernel install --user --name=virtualenv-name
```
or
```sh
ipython kernel isntall --user --name=virtualenv-name
```

#### Issue with virturalenv after brew upgrade python
It seems the references are broken. It shows like this:
```
dyld: Library not loaded: @executable_path/../.Python
  Referenced from: /Users/carrot/.virtualenvs/py3env/bin/python
  Reason: image not found
```

In fact, there is a problem with the library, you need to regenerate the links of the Python interpreter. In this case, this is just to remove the existing links and re-execute the virtualenv command.

First, deactivate the virtualenv
```
(py3env) ~ $ deactivate
```
then, find and delete all the symlinks, remove ```-delete``` flag to see symlinks
```
$HOME/.virtualenvs $ find py3env -type l -delete
```
Last, recreate virtualenv
```
$HOME/.virtualeves $ virtualenv py3env
```

#### Install graphviz on Windows
```bash
conda install python-graphviz
```
[Reference](https://github.com/ContinuumIO/anaconda-issues/issues/1666#issuecomment-301895525)

## MacVim

### Installation

```
brew install macvim
```

put ```alias vim="mvim -v"``` in ```.bashrc``` file. Comment this line and temporarily use system provide Vim if macvim doesn't work after system upgrade. E.g., Mojave to Catalina macvim ruby liabrary loading issue.


### [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
Download with [`vim-plug`](https://github.com/junegunn/vim-plug) and compile. Remember to recompile after updating with vim-plug.

~~Recommend to use latest macvim, but I use the vim that comes with macos.~~ Macvim is **requried**, turns out YCM won't work with pre-installed vim from Apple since its Python support is broken. If you want C-family completion, you __MUST__ have the latest `xcode` installed along with the latest Command Line Tools(They are are installed automatically when you run `clang` for the first time.or manually by running `xcode-select --install`).

Install `cmake`: ` brew install cmake `

Compile with semantic support for C-family languages:
```sh
$ cd ~/.vim/plugged/YouCompleteMe/
$ ./install.py --clang-completer
```

Compile without semantic support for C-family languages:
```sh
$ cd ~/.vim/plugged/YouCompleteMe/
$ ./install.py
```

After installation, `.ycm_extra_conf.py` file need to be configured in order to let semantic completer work. I'm using the default but it seems to have issues with my macos. I believe more details need to be added to it. Set global config file:

`let g:ycm_global_ycm_extra_conf` = \'~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py\'

When editing c files, semantic completer is default triggered by `. or >-`. For example, if you type `pri` first time, only character completer takes control and it won't help you complete `print` because it doesn't exist in the buffer yet. In addition, YCM has a short cut **CTRL + SPACE** to trigger semantic completer when needed. But **CTRL + SPACE** is held by input method switch system wide.

Thus you can either set short cut to other key pair: `let g:ycm_key_invoke_completion` = \'\<Leader\>z\'

or, add regex to update trigger requirements:
```
let g:ycm_semantic_triggers =  {
  \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
  \ 'cs,lua,javascript': ['re!\w{2}'],
  \ }
```

### [vimtex](https://github.com/lervag/vimtex)
`vimtex` is an amazing plugin for LaTex. Install `latexmk` package if you use `basictex`: `sudo tlmgr install latexmk`

### [UltiSnips](https://github.com/SirVer/ultisnips)
Remains to be done.

## [Xv6](https://pdos.csail.mit.edu/6.828/2018/xv6.html)

Reference book and source code booklet can be found on the webpage Xv6 sources and text section.

### [Tools install](https://pdos.csail.mit.edu/6.828/2018/tools.html)
### [Tools guide](https://pdos.csail.mit.edu/6.828/2018/labguide.html)
