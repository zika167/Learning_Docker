#!/bin/bash

# 1. Kiểm tra xem người dùng có nhập đủ 2 tham số không
if [ $# -ne 2 ]; then
    echo "Lỗi: Bạn cần nhập đủ 2 tham số."
    echo "Cách dùng: ./builder.sh <github-user/repo> <docker-hub-user/repo>"
    exit 1
fi

# Gán biến cho dễ đọc
GITHUB_REPO=$1
DOCKER_REPO=$2

echo "--- BẮT ĐẦU ---"

# 2. Tải code từ GitHub về một thư mục tạm (tên là my-temp-build)
echo "1. Đang tải code từ GitHub: $GITHUB_REPO..."
git clone https://github.com/$GITHUB_REPO.git my-temp-build

# 3. Build Docker Image
# Lưu ý: Chúng ta trỏ đường dẫn build vào thư mục 'my-temp-build' vừa tải về
echo "2. Đang Build Docker Image: $DOCKER_REPO..."
docker build -t $DOCKER_REPO ./my-temp-build

# 4. Đẩy lên Docker Hub
echo "3. Đang đẩy Image lên Docker Hub..."
docker push $DOCKER_REPO

# 5. Dọn dẹp (Xóa thư mục tạm đi cho sạch máy)
echo "4. Đang dọn dẹp..."
rm -rf my-temp-build

echo "--- THÀNH CÔNG! Image $DOCKER_REPO đã được public. ---"

# Lệnh chạy: ./builder.sh mluukkai/express_app zikar167/testing-script