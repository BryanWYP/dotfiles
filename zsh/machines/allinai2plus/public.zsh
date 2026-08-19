export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source /mnt/nvme3/wyp/venv/bin/activate
export PROJECT_ROOT="/mnt/nvme3/wyp"
# export PATH=${PROJECT_ROOT}/venv/bin:$PATH
# 强制 HuggingFace 把模型下载到大盘
export HF_HOME="$PROJECT_ROOT/cache/hf_models"
# 强制 uv 把包缓存放到大盘
export UV_CACHE_DIR="$PROJECT_ROOT/cache/uv"
# 强制 pip 包
export PIP_CACHE_DIR="${PROJECT_ROOT}/cache/pip"
# 强制 VLLM 包
export VLLM_CACHE_DIR="${PROJECT_ROOT}/cache/vllm"
# 强制系统临时文件放到大盘 (极其重要！编译 vllm 这种巨无霸时 /tmp 很容易爆)
export TMPDIR="$PROJECT_ROOT/tmp"

