# Setup

1. `git init --bare $HOME/.dotfiles`
- Create a [bare Git repository](https://www.atlassian.com/git/tutorials/setting-up-a-repository/git-init), which is an empty Git repository without a working directory.

2. `alias dot='/mingw64/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'`
- Create an alias for `git` e.g. `dot` to configure the .dotfiles repository.

3. `dot config --local status.showUntrackedFiles no`
- Configure Git to not show local files that are not being tracked when using commands like `dot status`.

4. `echo "alias dot='/mingw64/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'" >> $HOME/.zshrc`
- Add `dot` alias to `~/.zshrc`.

## Clone

1. `git clone --bare <git-repository-url> $HOME/.dotfiles`
2. `echo "alias dot='/mingw64/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'" >> $HOME/.zshrc`
3. `dot checkout`
4. `dot config --local status.showUntrackedFiles no`

## Update 

1. `dot status`
2. `dot add .gitconfig` or `dot add ./config/nvim/init.vim`
3. `dot add .zshrc`
4. `dot commit -m "Add dotfiles"`
5. `dot push`
