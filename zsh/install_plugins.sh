#!/bin/sh

echo "🔄 安装 zsh 插件..."

mkdir -p ~/.zsh/plugins/

# direct install oh-my-zsh
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.zsh/plugins/oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh/plugins/powerlevel10k
git clone --depth=1 https://github.com/zsh-users/zsh-completions.git ~/.zsh/plugins/zsh-completions
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/marlonrichert/zsh-autocomplete.git ~/.zsh/plugins/zsh-autocomplete
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/junegunn/fzf-git.sh.git ~/.zsh/plugins/fzf-git.sh

echo "✅ zsh 插件安装完成"
echo