#!/bin/sh

echo "🔄 安装 zsh 插件..."

mkdir -p ~/.zsh/plugins/

# direct install oh-my-zsh
git clone https://gitee.com/shumkashun/ohmyzsh.git ~/.zsh/plugins/oh-my-zsh
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ~/.zsh/plugins/powerlevel10k
git clone --depth=1 https://gitee.com/shumkashun/zsh-completions.git ~/.zsh/plugins/zsh-completions
git clone --depth=1 https://gitee.com/shumkashun/zsh-autosuggestions.git ~/.zsh/plugins/zsh-autosuggestions
# git clone --depth=1 https://github.com/marlonrichert/zsh-autocomplete.git ~/.zsh/plugins/zsh-autocomplete
git clone --depth=1 https://gitee.com/shumkashun/zsh-syntax-highlighting ~/.zsh/plugins/zsh-syntax-highlighting
# git clone --depth=1 https://github.com/junegunn/fzf-git.sh.git ~/.zsh/plugins/fzf-git.sh
 git clone --depth=1 https://gitee.com/shumkashun/zsh-history-substring-search ~/.zsh/plugins/zsh-history-substring-search
echo "✅ zsh 插件安装完成"