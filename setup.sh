get_system_info() {
    OS_TYPE="$(uname)"
    ARCH_TYPE="$(uname -m)"
}
if [ "$OS_TYPE" = "Linux" ]; then
    apt update
fi

bash ./zsh/activate_zsh.sh
bash ./brew/install.sh
./install
bash ./zsh/install_plugins.sh

