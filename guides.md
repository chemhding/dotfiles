## HomeBrew

`Brew cask` is an extension of `Homebrew`.

Show package info: `Brew info` or `Brew cask info`.

## basictex

Use `tlmgr` to install packages: `sudo tlmgl install <name>`.

To show installed packages: `tlmgl list --only-installed`.

To show all packages: `tlmgl list`.

## python

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

Create file `~/.matplotlib/matplotlibrc` and add line `backend:TkAgg`

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
