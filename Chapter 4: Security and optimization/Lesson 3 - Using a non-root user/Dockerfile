FROM ubuntu:24.04
WORKDIR /mydir
# Cài đặt curl và python
RUN apt-get update && apt-get install -y curl python3
# ... (các bước cài yt-dlp như hình) ...

RUN useradd -m appuser

# QUAN TRỌNG: Trao quyền sở hữu thư mục hiện tại (.) cho appuser
RUN chown appuser .

# Bây giờ mới chuyển user
USER appuser

ENTRYPOINT ["/usr/local/bin/yt-dlp"]