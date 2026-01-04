# Sử dụng image có sẵn docker và git (Alpine Linux)
FROM docker:git

# Thiết lập thư mục làm việc
WORKDIR /app

# Copy file script từ máy bạn vào trong container
COPY builder.sh .

# Cấp quyền thực thi cho script
RUN chmod +x builder.sh

# Thiết lập ENTRYPOINT
# Khi container chạy, nó sẽ tự động chạy file này và nhận các tham số phía sau
ENTRYPOINT ["/app/builder.sh"]