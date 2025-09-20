FROM n8nio/n8n:latest-debian

# نستخدم root عشان نثبت الأدوات
USER root

# تحديث الـ sources + تثبيت الأدوات + yt-dlp
RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list && \
    sed -i '/security.debian.org/d' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
        ffmpeg \
        curl \
        wget \
        git \
        nano && \
    pip3 install --no-cache-dir yt-dlp && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# إنشاء مجلد البيانات وضبط الصلاحيات لـ node
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node

# نرجع لـ user الافتراضي بتاع n8n
USER node

# تشغيل n8n
CMD ["n8n"]
