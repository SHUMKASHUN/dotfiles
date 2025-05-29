#!/bin/sh

# ----- bash to zsh -----
current_shell=`which "$SHELL"`

if echo "$current_shell" | grep -q "zsh"; then
    zsh_version=`zsh --version | cut -d' ' -f2`
    echo "✅ Current shell is already zsh: $current_shell (version $zsh_version)"
    echo
else
    echo "⚠️ Current shell is not zsh. Checking if zsh is available..."

    if which zsh >/dev/null 2>&1; then
        zsh_path=`which zsh`
        zsh_version=`zsh --version | cut -d' ' -f2`
        echo "🔄 zsh($zsh_path version $zsh_version) is available. Attempting to switch to zsh..."
        if [ "$(whoami)" = "root" ]; then
            chsh -s "$zsh_path" "$LOGNAME"
        else
            sudo chsh -s "$zsh_path" "$LOGNAME"
        fi
        echo "🔔 Shell changed. Please log out and log back in for changes to take effect."
        echo
    else
        echo "❌ zsh is not installed or not in PATH. Please install zsh first."
        echo "💡 If Homebrew is installed, run:"
        echo "  brew install zsh"
        echo "  sudo chsh -s \"\`brew --prefix\`/bin/zsh\" \"\\\$LOGNAME\""
        echo "💡 On Ubuntu, run:"
        echo "  sudo apt update"
        echo "  sudo apt install zsh -y"
        echo "  sudo chsh -s \"\`which zsh\`\" \"\\\$LOGNAME\""
        echo "  Trying automatically run for you"
        if [ "$(whoami)" = "root" ]; then
            apt install zsh -y
            chsh -s \"\`which zsh\`\" \"\\\$LOGNAME\"
        else
            sudo apt install zsh -y
            sudo chsh -s \"\`which zsh\`\" \"\\\$LOGNAME\"
        fi    
    fi
    echo "export SHELL=/bin/zsh" >> ~/.bashrc
    echo "exec /bin/zsh -l" >> ~/.bashrc
    
    echo "ℹ️ Current shell path is: $current_shell"
    echo
fi