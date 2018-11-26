Intro
-----
Some instructions of dot files.

## vimrc
### [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
Download with [`vim-plug`](https://github.com/junegunn/vim-plug) and compile. Remember to recompile after updating with vim-plug.

Recommend to use latest macvim, but I use the vim that comes with macos. If you want C-family completion, you __MUST__ have the latest `xcode` installed along with the latest Command Line Tools(They are are installed automatically when you run `clang` for the first time.or manually by running `xcode-select --install`).

Install `cmake`: ` brew install cmake `

Compile with semantic support for C-family languages:
```
cd ~/.vim/plugged/YouCompleteMe/
./install.py --clang-completer
```

Compile without semantic support for C-family languages:
```
cd ~/.vim/plugged/YouCompleteMe/
./install.py
```

### [vimtex](https://github.com/lervag/vimtex)
`vimtex` is an amazing plugin for LaTex. Install `latexmk` package since I use `basictex`: `sudo tlmgr install latexmk`

### [UltiSnips](https://github.com/SirVer/ultisnips)
Remains to be done.
