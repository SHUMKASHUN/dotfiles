
if [ "$(uname)" = "Linux" ]; then
    sudo su
    echo "...apt update..."
    apt update
fi

# Make sure to activate zsh
bash ./zsh/activate_zsh.sh
rm ~/.zshrc
rm -rf ~/.zsh
./install
bash ./zsh/install_plugins.sh
bash ./x-cmd/install_x.sh

