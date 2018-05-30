#!/usr/bin/env bash

# Function keyword used here as config is an alias
function config() {
    /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

setup_git_macos() {

    echo "Git..."

    install_homebrew_macos
    brew install git

    echo "Git finished"
}

setup_git_linux() {

    echo "Git..."

    sudo apt-get -qq update
    sudo apt-get -qq install git

    echo "Git finished"
}

setup_dotfiles() {

    echo "Dotfiles..."

    # Check if repo is already present
    config status

    if [ $? != 0 ]; then
        echo "Cloning dotfiles..."
        git clone --quiet --bare https://github.com/berndhartzer/dotfiles.git $HOME/.cfg
    fi

    mkdir -p .dotfiles-backup

    config checkout

    if [ $? != 0 ]; then
        echo "Backing up existing dotfiles...";
        config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
    fi;

    config checkout
    config config --local status.showUntrackedFiles no

    echo "Dotfiles finished"
}

setup_homebrew_macos() {

    echo "Homebrew..."

    install_homebrew_macos

    if [ -f Brewfile ]; then
        echo "Installing Homebrew packages using Brewfile..."
        brew bundle
    else
        echo "Exiting: can't find Brewfile"
        exit 1
    fi

    echo "Homebrew finished!"
}

setup_packages_linux() {

    echo "Packages..."

    sudo apt-get -qq install awscli git tmux tree vim

    echo "Packages finished!"
}

setup_fzf() {

    echo "FZF..."

    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

    echo -e "y\ny\nn\n" | ~/.fzf/install

    echo "FZF finished!"
}

setup_vim() {

    echo "Vim..."

    if [ ! -f ~/.vim/autoload/plug.vim ]; then
        echo "Installing vim-plug..."
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi

    echo "Installing Vim plugins..."
    vim +PlugInstall +qall

    echo "Vim finished!"
}

install_homebrew_macos() {

    if ! which brew > /dev/null 2>&1; then
        echo "Installing Homebrew..."
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    echo "Updating Homebrew..."
    brew update
}

bootstrap_macos() {

    echo "Beginning set up on macOS..."

    setup_git_macos
    setup_dotfiles
    setup_homebrew_macos
    setup_fzf
    setup_vim

    echo "Finished set up on macOS!"
}

bootstrap_linux() {

    echo "Beginning set up on Linux..."

    setup_git_linux
    setup_dotfiles
    setup_packages_linux
    setup_fzf
    setup_vim

    echo "Finished set up on Linux!"
}

if [ "$(uname)" == "Darwin" ]; then
    bootstrap_macos
fi

if [ "$(uname)" == "Linux" ]; then
    bootstrap_linux
fi
