FROM n8nio/n8n:latest

USER root

# تثبيت الأدوات الأساسية على Alpine
RUN apk add --no-cache \
    python3 \
    py3-pip \
    ffmpeg \
    curl \
    wget \
    git \
    nano \
  && pip3 install --no-cache-dir yt-dlp

USER node
