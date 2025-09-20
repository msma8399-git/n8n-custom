FROM n8nio/n8n:latest-debian

USER root

RUN apt-get update && \
    apt-get install -y python3-pip ffmpeg curl wget git nano && \
    pip3 install --no-cache-dir yt-dlp && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

USER node
