## HomeBrew

`Brew cask` is an extension of `Homebrew`.

Show package info: `Brew info` or `Brew cask info`.

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

Install python and python2

```sh
brew install python python@2
```

Install virtualenv and virtualenvwrapper

#### Windows

Try anaconda.

### Issues

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

## Vim

### [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
Download with [`vim-plug`](https://github.com/junegunn/vim-plug) and compile. Remember to recompile after updating with vim-plug.

Recommend to use latest macvim, but I use the vim that comes with macos. If you want C-family completion, you __MUST__ have the latest `xcode` installed along with the latest Command Line Tools(They are are installed automatically when you run `clang` for the first time.or manually by running `xcode-select --install`).

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

### [vimtex](https://github.com/lervag/vimtex)
`vimtex` is an amazing plugin for LaTex. Install `latexmk` package if you use `basictex`: `sudo tlmgr install latexmk`

### [UltiSnips](https://github.com/SirVer/ultisnips)
Remains to be done.

## [Xv6](https://pdos.csail.mit.edu/6.828/2018/xv6.html)

Reference book and source code booklet can be found on the webpage Xv6 sources and text section.

### [Tools install](https://pdos.csail.mit.edu/6.828/2018/tools.html)
### [Tools guide](https://pdos.csail.mit.edu/6.828/2018/labguide.html)
