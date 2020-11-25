
#### Table of contents

1.[ Installation](#install)

2.[ Usage](#using)

---

This is my simple config for vimrc, it using plugin from vundle and some shortcut for me to ez use


<a name="install"></a>
##### 1. Installation

The configuration file supports the plugin with [vundle](https://github.com/VundleVim/Vundle.vim)

The plugin installed 

- Plugin [VundleVim/Vundle.vim](https://github.com/VundleVim/Vundle.vim)

- Plugin [scrooloose/nerdtree](https://github.com/preservim/nerdtree)
    
- Plugin [majutsushi/tagbar](https://github.com/preservim/tagbar)
    
- Plugin [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)

> You can add more plugin using [vundle](https://github.com/VundleVim/Vundle.vim) at [vimawesome](https://vimawesome.com/)

Install simple
```
git  clone  https://github.com/ctnguyenvn/vimrc
cd vimrc && bash install.sh
```
<a name="using"></a>
##### 2. Usage

|Shortcut|exec|
|---|---|
|;+w|save faster|
|F2|Open/Off NERTree|
|F3|Open/Off tagbar|
|Ctrl+ww|move to next window(when open multi window or open NERDTree)|
|tab|move between buffer|

--- 

##### Requirement

Tagbar plugin require ctags, please install it befor use tagbar (like F2)

Arch linux

> sudo pacman -S ctags

Ubuntu 

> sudo apt install ctags

Centos

> sudo yum install ctags

--- 

##### Update...