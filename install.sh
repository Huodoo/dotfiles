#!/usr/bin/env bash

# 描述: 安装 dotfiles 配置文件脚本
# 功能: 将以 _ 开头的配置文件链接为用户主目录下的隐藏文件

set -e

# 获取脚本所在目录作为 DOTFILES_DIR
readonly DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly TIMESTAMP="$(date +%s)"

# 进入 dotfiles 目录
cd "$DOTFILES_DIR" || exit 1

# 处理每个以 _ 开头的文件
for item in _*; do
  # 如果没有匹配的文件则跳过 (处理 glob 不匹配的情况)
  [ ! -e "$item" ] && [ ! -L "$item" ] && continue
  
  # 将 _ 开头的文件名转换为 . 开头的目标文件名
  target_name=".${item#_}"
  
  # 判断是否为目录
  if [ -d "$item" ]; then
    # 创建目标目录
    mkdir -p "$HOME/$target_name"
    
    # 遍历目录下的所有项目（仅第一层）
    for sub_item in "$item"/*; do
      # 如果没有匹配的文件则跳过 (处理 glob 不匹配的情况)
      [ ! -e "$sub_item" ] && [ ! -L "$sub_item" ] && continue
      
      sub_item_basename=$(basename "$sub_item")
      readonly SUB_ITEM_TARGET="$HOME/$target_name/$sub_item_basename"
      
      # 如果目标文件已存在且不是符号链接，则备份
      if [ -e "$SUB_ITEM_TARGET" ] && [ ! -L "$SUB_ITEM_TARGET" ]; then
        mv "$SUB_ITEM_TARGET" "$SUB_ITEM_TARGET.bak.$TIMESTAMP"
        echo "备份 $SUB_ITEM_TARGET 至 $SUB_ITEM_TARGET.bak.$TIMESTAMP"
      fi

      # 如果目标已经是符号链接，则删除
      [ -L "$SUB_ITEM_TARGET" ] && rm -f "$SUB_ITEM_TARGET"

      # 创建新的符号链接
      ln -sv "$DOTFILES_DIR/$sub_item" "$SUB_ITEM_TARGET"
    done
  else
    readonly TARGET="$HOME/$target_name"

    # 如果目标文件已存在且不是符号链接，则备份
    if [ -e "$TARGET" ] && [ ! -L "$TARGET" ]; then
      mv "$TARGET" "$TARGET.bak.$TIMESTAMP"
      echo "备份 $TARGET 至 $TARGET.bak.$TIMESTAMP"
    fi

    # 如果目标已经是符号链接，则删除
    [ -L "$TARGET" ] && rm -f "$TARGET"

    # 创建新的符号链接
    ln -sv "$DOTFILES_DIR/$item" "$TARGET"
  fi
done

echo "🎉 配置完成"