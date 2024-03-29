MacOS
---

### Repeating keys

When typing in some applications, pressing and holding a key for example ```a``` gives you ```à á â ä æ ã å ā```. That is 
because the repeating key is enabled. To disable repeating keys in system-wide, you can type:

```
defaults write -g ApplePressAndHoldEnabled -bool false
```

In addition, it can be disabled for certain application. For example, disable repeating keys for pycharm, which is very 
helpful when using plugin ```IdeaVim```.

```
defaults write com.jetbrains.pycharm ApplePressAndHoldEnabled -bool false
```
For CLion:
```
defaults write com.jetbrains.clion ApplePressAndHoldEnable -bool false
```

For VSCodium:
```
defaults write com.visualstudio.code.oss ApplePressAndHoldEnabled -bool false
```

For VSCode:
```
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
```

Referred from [here](https://gist.github.com/lsd/1e1826907ab7e49c536a).

linux shell (some may only apply in zsh)
---

To show directories history that accessed, type `dirs -v`:
>~ $ dirs -v  
>0 &nbsp; &nbsp; &nbsp; &nbsp; ~  
>1 &nbsp; &nbsp; &nbsp; &nbsp; ~/Documents/gitrepo/dotfiles

Then change to the directory in output, type `~#` or `cd -#` (`#` is the number in the list)
>~ $ ~1  
>~/Documents/gitrepo/dotfiles $

Show first 10 entries of the list: `dirs -v | head -10`

Repeat last command: simply type `r` and `return`
>~ $ r  
>python --version  
>Python 2.7.15

`r <WORD>` will repeat last command that contains `<WORD>`  

Retrieve last command in current command: `!!`. Very useful if you forget to use `sudo` in front of a command: `sudo !!`

`^foo^boo` will take the last command and replace the first instance of "foo" with "boo".

>$ echo foo foo  
>foo foo
>
>$ ^foo^boo  
>echo boo foo  
>boo foo

While in zsh, you can use `^foo^boo^:G` for global replace.

>$ echo foo foo  
>foo foo
>
>$ ^foo^boo^:G  
>echo boo boo  
>boo boo

`fc` allows you edit last commands in your default editor

`fc -s`also does the replace trick:
>$ echo foo foo  
>foo foo  
>
>$ fc -s foo=boo  
>echo boo boo  
>boo boo

In addition, `!!:gs/foo/boo` does the global search and replaces `foo` with `boo` as well:
>$ echo foo foo  
>foo foo
>
>!!:gs/foo/boo  
>echo boo boo  
>boo boo

### Remove all files except pdf and tex file in a folder
Use `find` command:

`find . -type f ! \( -name "*.pdf" -o -name "*.tex" \)`, or

`find . -type f -not -name "*.pdf" -not -name "*.tex"`

That lists all matched files. Use `-delete` to delete. Use `-type f` to limit on files only not directories. Use `-depth 1` to specify only on this level, no subdirectories.

`find . -depth 1 -type f -not -name "*.pdf" -not -name "*.tex" -delete`

### Downloading consecutive numbered files
```
wget http://xxx/xxx/lec{0..10}.pdf
```
