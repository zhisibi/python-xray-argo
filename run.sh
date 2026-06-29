#!/bin/bash

# 确保脚本在遇到任何错误时立即停止执行
set -e

echo "=== 🚀 开始启动应用 ==="

# 1. 检查是否存在 Python 虚拟环境并自动激活
if [ -d ".venv" ]; then
    echo "📦 检测到 .venv 虚拟环境，正在激活..."
    source .venv/bin/activate
elif [ -d "venv" ]; then
    echo "📦 检测到 venv 虚拟环境，正在激活..."
    source venv/bin/activate
else
    echo "⚠️ 未检测到本地虚拟环境（可选配置）"
fi

# 2. 检查并安装依赖
if [ -f "requirements.txt" ]; then
    echo "📥 正在检查并安装依赖..."
    pip install -r requirements.txt
else
    echo "❌ 错误: 未找到 requirements.txt 文件！"
    exit 1
fi

# 3. 运行 Python 应用（修正了拼写错误 pyhon -> python）
if [ -f "app.py" ]; then
    echo "🏃 正在启动 app.py..."
    echo "--------------------------------"
    python app.py
else
    echo "❌ 错误: 未找到 app.py 文件！"
    exit 1
fi
