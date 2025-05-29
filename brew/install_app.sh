#!/bin/sh

# 检查是否为 ARM Linux
if uname -a | grep -q "Linux" && uname -m | grep -q "aarch64"; then
    echo "⚠️ ARM Linux 暂不支持 Homebrew，退出安装..."
    exit 0
fi

# Update apt source
if [ "$(uname)" = "Linux" ]; then
    apt install -y gpg wget
    mkdir -p /etc/apt/keyrings
    wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
    echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | tee /etc/apt/sources.list.d/gierens.list
    chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
    curl -fsSL https://apt.cli.rs/pubkey.asc | tee -a /usr/share/keyrings/rust-tools.asc
    curl -fsSL https://apt.cli.rs/rust-tools.list | tee /etc/apt/sources.list.d/rust-tools.list
    apt update
fi



# 安装单个包的函数
install_package() {
    echo "📦 正在安装: $1"
    if [ "$(uname)" = "Linux" ]; then
        if apt install -y "$1" 2>/dev/null; then
            echo "✅ 成功安装: $1"
        else
            echo "❌ 安装失败: $1"
            return 1
        fi
    else
        if brew install -y "$1" 2>/dev/null; then
            echo "✅ 成功安装: $1"
        else
            echo "❌ 安装失败: $1"
            return 1
        fi
    fi
}

# 从文件读取并安装包的函数
install_from_file() {
    while read -r package || [ -n "$package" ]; do
        # 跳过空行和注释
        case "$package" in
            ""|\#*) continue ;;
            *) install_package "$package" || : ;;  # : 是 shell 的空操作符
        esac
    done < "$1"
}


# 根据系统添加 Homebrew 路径
if uname -a | grep -q "Darwin"; then
    # macOS
    eval "$(/opt/homebrew/bin/brew shellenv)"
    echo "🍏 brew 安装 mac apps..."
    install_from_file ~/.dotfiles/brew/brew-mac.txt
else
    # Linux (x86_64)
    # eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    echo "🐧 apt 安装 linux apps..."
    install_from_file ~/.dotfiles/brew/brew-linux.txt
fi

# 安装通用应用
# echo "🍺 brew 安装通用 apps..."
# install_from_file ~/.dotfiles/brew/brew-both.txt

echo "🎉 安装完成！"