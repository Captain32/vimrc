# Captain32 vim配置使用

## VIM学习资料

* [常用cheatsheets](https://github.com/skywind3000/awesome-cheatsheets/blob/master/editors/vim.txt)
* [官方帮助文档](http://vimdoc.sourceforge.net/htmldoc/)
* [Awesome插件](https://vimawesome.com/)
* [VimScipt教程](https://learnvimscriptthehardway.stevelosh.com/)

## 安装

    git clone --depth=1 https://github.com/Captain32/vimrc.git ~/.vim_runtime # https
    git clone git@github.com:Captain32/vimrc.git ~/.vim_runtime # ssh
    sh ~/.vim_runtime/install_awesome_vimrc.sh
    git submodule update --init --recursive

## 安装插件

总体方法是，用pathogen管理，方法如下：

    cd ~/.vim_runtime
    git submodule add https://github.com/submodule-name.git my_plugins/submodule-name # add plugin's git url to submodule
    git submodule update --init --recursive # update submodule (pull the submodule)

下面是已经安装的自定义插件。

### [vim-cpp-enhanced-highlight](https://github.com/octol/vim-cpp-enhanced-highlight)

用于C/C++代码高亮，因为vim自带的不够好。

### [vim-go](https://github.com/fatih/vim-go)

包含了Go语言的一系列命令，代码补全插件(gopls)等等。

**额外需要**

* 安装go
* 首次进入vim需要安装vim-go需要的一系列二进制文件(需要翻墙)
    * 会提示用`:GoInstallBinaries`进行安装
    * 有可能会要配置`GOPATH`(假如没配置的话)，可以`go env`看一下，没有的话配置下，我一般配置到`~/go`(换成绝对路径)
    * 翻墙失败的话就得手动安装了，可以参考[go get 方法](https://www.sunzhongwei.com/vim-execution-goinstallbinaries-installation-depend-on-failure)或[纯手动](https://bewaremypower.github.io/2019/06/21/%E6%88%91%E7%9A%84vim%E5%BC%80%E5%8F%91%E7%8E%AF%E5%A2%83%E6%90%AD%E5%BB%BA-3-Go%E5%BC%80%E5%8F%91%E9%85%8D%E7%BD%AE/)。注意手动模式有的没有go.mod会导致无法go install，`go mode init`生成一个go.mod即可。

### [coc.nvim](https://github.com/neoclide/coc.nvim)

管理代码补全插件的神器，本身也可以在其MarketPlace安装各个语言的插件，也可以通过`coc-settings.json`配置language server的方式实现。

在`my_configs.vim`中也自定义了一些初始化时就安装的语言插件，比如：

    let g:coc_global_extensions = ['coc-tsserver','coc-html','coc-css', 'coc-json',
            \ 'coc-java','coc-pyright','coc-flutter',
            \ 'coc-emmet','coc-snippets','coc-xml','coc-yaml',
            \ 'coc-markdownlint','coc-highlight',
            \ 'coc-clangd','coc-sh','coc-go','coc-sql']



**额外需要**

* 安装nodejs
    * `brew install node # MacOS`
* 安装yarn
    * `npm install -g yarn`
* 使用yarn为coc.nvim安装所需包
    *  进入到`.vim_runtime/my_plugins/coc.nvim`目录中
    *  `yarn install`即可
* 需要使用C/C++补全的话，因为用了coc-clangd插件，还得在本机安装clangd才能生效
    * `brew install llvm`即可
    * 上一步
* 需要使用Go补全的话，因为用了gopls插件，需要在本机安装gopls(之前的vim-go安装过)

### [vim-instant-markdown](https://github.com/instant-markdown/vim-instant-markdown)

可以实时在浏览器中预览markdown。

**额外需要**

* 安装`instant-markdown-d`
    * `npm -g install instant-markdown-d`即可
* 注意不要开代理，不然无法浏览器预览，小飞机得关掉

### [vim-airline](https://github.com/vim-airline/vim-airline)

一个强大的statusline和tabline工具，可以取代lightline的作用(在my_comfigs.vim中禁掉)，airline支持很多插件的扩展，具体可以看文档，想要选择不同的airline主题的话需要安装[vim-ariline-themes](https://github.com/vim-airline/vim-airline-themes)插件。

### [vim-bufferline](https://github.com/bling/vim-bufferline)

一个可以在命令行处显示当前buffer的插件，可以集成到airline中，但是由于自己的Mac会显示E541(状态栏东西过多)，出于强迫症禁掉了，还是在命令行显示。

### [nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)

一个可以在NERDTree中显示出文件当前git状态的插件。

### [Vista](https://github.com/liuchengxu/vista.vim)

一个可以显示出代码中组织结构的插件，默认通过ctags可以支持很多种语言，也可以为每个语言个性化配置所使用的插件。

**额外需要**

* 由于默认需要ctags支持，所以需要安装ctags，官方推荐安装[universal-ctags](https://github.com/universal-ctags/ctags)
    * 对于Mac可以选择直接用brew安装，`brew install --HEAD universal-ctags/universal-ctags/universal-ctags`
    * 对于Linux可以选择直接从源码编译安装，详见github文档
* 默认使用的ctags就可以支持很多语言，可以通过`ctags --list-languages`查看ctags支持的语言，通过`ctags --list-kinds=c++`这样类似的命令就可以看到ctags对该语言所支持的解析tag，进而据此个性化配置。

### [LeaderF](https://github.com/Yggdroot/LeaderF)

一个强大的搜索工具，可以作为CtrlP的替代品，性能和搜索效果都要更好，可以查找文件、Buffer、函数、Buffer内的Tag、MRU等等。

**额外需要**

* LeaderF需要借助[ripgrep](https://github.com/BurntSushi/ripgrep)实现正则表达式或者字符串检索, 也即是常说的grep操作, 就是在指定的文件集合中查找那些包含已知的字符串或者包含能匹配上正则表达式字符串的行。需要在本机上安装，Mac直接brew安装即可。
* LeaderF需要借助`gtags`实现对静态符号索引文件的搜索，可以实现跳转等功能，这个我就没有选择安装，因为`coc-nvim`已经提供了跳转功能，`Vista`依赖的`ctags`也已经把buffer中的tag整理出来了。
* LeaderF的配置主要参考了[vim plugin介绍之LeaderF](https://retzzz.github.io/dc9af5aa/)，讲得很清楚，不过更具体操作看原github文档即可。

## 个性化配置

主题选用了`solarized`，由于主题颜色需要提前配置生效，所以在`extended.vim`中进行了配置。其他详见`my_configs.vim`。
