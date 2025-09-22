#!/bin/bash

# 检查是否已经初始化Git仓库
if [ ! -d ".git" ]; then
  echo "初始化Git仓库..."
  git init
else
  echo "Git仓库已存在"
fi

# 检查远程仓库是否已配置
if ! git remote | grep -q origin; then
  echo "添加远程仓库..."
  git remote add origin https://github.com/cyuanxv/markitdown-sever-new.git
else
  echo "更新远程仓库URL..."
  git remote set-url origin https://github.com/cyuanxv/markitdown-sever-new.git
fi

# 添加所有文件到暂存区
git add .

# 提交更改
echo "提交更改..."
git commit -m "初始提交 markitdown 项目"

# 推送到GitHub
echo "推送到GitHub..."
git push -u origin master

echo "完成！项目已成功提交到GitHub仓库。"