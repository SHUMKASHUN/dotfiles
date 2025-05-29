if [ "$(uname)" = "Linux" ]; then
    echo "...apt update..."
    apt update
fi

bash ./zsh/activate_zsh.sh
bash ./brew/install_app.sh
./install
bash ./zsh/install_plugins.sh

