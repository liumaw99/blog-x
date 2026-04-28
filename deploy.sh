#!/bin/bash
set -e

# OSS 配置（优先从环境变量读取）
OSS_ENDPOINT="${OSS_ENDPOINT:-oss-cn-hangzhou.aliyuncs.com}"
OSS_BUCKET="${OSS_BUCKET:-whw-cn}"
OSS_ACCESS_KEY_ID="${OSS_ACCESS_KEY_ID:-}"
OSS_ACCESS_KEY_SECRET="${OSS_ACCESS_KEY_SECRET:-}"

log() { echo -e "\033[0;32m[INFO]\033[0m $1"; }
warn() { echo -e "\033[1;33m[WARN]\033[0m $1"; }
err() { echo -e "\033[0;31m[ERROR]\033[0m $1"; exit 1; }

# 1. 构建
log "构建站点..."
rm -rf public/
hugo --gc --minify
[ -d "public" ] || err "构建失败"

# 2. 检查凭证
[ -z "$OSS_ACCESS_KEY_ID" ] || [ -z "$OSS_ACCESS_KEY_SECRET" ] && {
  warn "凭证未设置"
  echo "export OSS_ACCESS_KEY_ID=xxx; export OSS_ACCESS_KEY_SECRET=yyy"
  exit 1
}

# 3. 准备 ossutil
OSSUTIL="./ossutil"
if [ ! -f "$OSSUTIL" ] || ! "$OSSUTIL" -v &>/dev/null; then
  log "下载 ossutil..."
  [ "$(uname -s)" = "Darwin" ] && [ "$(uname -m)" = "arm64" ] \
    && URL="https://gosspublic.alicdn.com/ossutil/1.7.18/ossutilmacarm64" \
    || URL="https://gosspublic.alicdn.com/ossutil/1.7.18/ossutil64"
  curl -fsSL "$URL" -o "$OSSUTIL" && chmod +x "$OSSUTIL"
fi

# 4. 清空并上传
log "清空旧文件..."
$OSSUTIL -e "$OSS_ENDPOINT" -i "$OSS_ACCESS_KEY_ID" -k "$OSS_ACCESS_KEY_SECRET" rm -r -f "oss://$OSS_BUCKET/"

log "上传中..."
$OSSUTIL -e "$OSS_ENDPOINT" -i "$OSS_ACCESS_KEY_ID" -k "$OSS_ACCESS_KEY_SECRET" cp -r -f public/ "oss://$OSS_BUCKET/"

log "完成！"
