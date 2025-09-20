FROM n8nio/n8n:latest-debian

USER root

# تحديث الـ sources + تثبيت الأدوات
RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list && \
    sed -i '/security.debian.org/d' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        python3-pip \
        ffmpeg \
        curl \
        wget \
        git \
        nano && \
    pip3 install --no-cache-dir yt-dlp && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

USER node
