# Dotfiles

My dotfiles, which are set up and managed using a bare git repository. I followed this guide to set it up: [The best way to store your dotfiles: A bare Git repository](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/).

## Fresh installation

To begin a fresh installation on new machine, run the `bin/install.sh` script. This can be done via url with curl:

```bash
bash <(curl -s https://raw.githubusercontent.com/berndhartzer/dotfiles/master/bin/install.sh)
```

## Usage

Use the `config` alias to interact with the repo.

```bash
config status
config add .vimrc
config commit -m "Add vimrc"
config push
```

---

_As stated above, I followed [this guide](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/) to set up this repo. Below I've got some notes on the process for my own purposes. I recommend reading the full article if you're interested in setting up something similar._

## The initial set up

```bash
# Create the git bare repo
git init --bare $HOME/.cfg

# Create the config alias for interacting with the repo
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Set a flag local to the repo to hide files unless explicitly tracked
config config --local status.showUntrackedFiles no

# Add the config alias to .bashrc
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```

## Installing these dotfiles on a new system

```bash
# Set up the config alias
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Add .cfg to gitignore to avoid recursion problems
echo ".cfg" >> .gitignore

# Clone the dotfiles into a bare repo in a "dot" folder
git clone --bare <git-repo-url> $HOME/.cfg

# Define the alias in the current shell scope
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Checkout the content from the bare repository
config checkout

# The checkout might fail if any of the files already exist
# If so; backup and/or remove as necessary and checkout again

# Set the local showUntrackedFiles no flag
config config --local status.showUntrackedFiles no

# Now we can interact with the repo
config status
config add .bashrc
config commit -m "Added bashrc"
config push
```
