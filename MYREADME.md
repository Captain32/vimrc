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

### [tagbar](https://github.com/preservim/tagbar)

一个可以显示出代码中组织结构的插件，可以支持很多种语言，配置每个语言详见[Wiki](https://github.com/preservim/tagbar/wiki)。

**额外需要**

* 由于tagbar底层需要ctags支持，所以需要安装ctags，官方推荐安装[universal-ctags](https://github.com/universal-ctags/ctags)
    * 对于Mac可以选择直接用brew安装，`brew install --HEAD universal-ctags/universal-ctags/universal-ctags`
    * 对于Linux可以选择直接从源码编译安装，详见github文档
* 配置tagbar对于Go的支持，需要本机安装[gotags](https://github.com/jstemmer/gotags)，这个其实在装vim-go依赖二进制文件时就已经安装了，然后再按照[gotags](https://github.com/jstemmer/gotags)页面的配置内容粘到my_configs.vim即可，需要注意`ctagsbin`字段，这个字段表示了tagbar将用什么作为底层解析支持，假如GOBIN配置了的话这里直接`gotags`即可，没有的话就需要添加上具体路径，比如我的`~/go/bin/gotags`
* 对于每一个语言都可以类似刚才对Go配置的那样，明确我们需要的tag是哪些，具体可以见tagbar文档或者参照[标识符列表](https://www.bookstack.cn/read/use_vim_as_ide/4.6.md)博客进行配置方法学习。
    * 默认使用的ctags就可以支持很多语言，可以通过`ctags --list-languages`查看ctags支持的语言(很多都可以，Go也可以，只不过更推荐用gotags)，通过`ctags --list-kinds=c++`这样类似的命令就可以看到ctags对该语言所支持的解析tag，进而据此个性化配置。

## 个性化配置

主题选用了`solarized`，由于主题颜色需要提前配置生效，所以在`extended.vim`中进行了配置。其他详见`my_configs.vim`。
