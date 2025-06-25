if [ "$(uname)" = "Linux" ]; then
    echo "...apt update..."
    apt update
fi

# Make sure to activate zsh
bash ./zsh/activate_zsh.sh
bash ./zsh/install_plugins.sh
./install
bash ./x-cmd/install_x.sh

