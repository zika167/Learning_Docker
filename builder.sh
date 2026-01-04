#!/bin/sh

# Kiểm tra tham số
if [ $# -ne 2 ]; then
    echo "Usage: $0 <github-repo> <docker-repo>"
    exit 1
fi

GITHUB_REPO=$1
DOCKER_REPO=$2

# --- PHẦN MỚI: Đăng nhập Docker Hub từ bên trong container ---
# Lấy User và Pass từ biến môi trường (sẽ truyền vào khi chạy docker run)
if [ -n "$DOCKER_PWD" ] && [ -n "$DOCKER_USER" ]; then
    echo "$DOCKER_PWD" | docker login -u "$DOCKER_USER" --password-stdin
else
    echo "Lỗi: Chưa nhập User/Pass của Docker Hub"
    exit 1
fi
# -------------------------------------------------------------

echo "1. Cloning $GITHUB_REPO..."
git clone https://github.com/$GITHUB_REPO.git my-project

echo "2. Building $DOCKER_REPO..."
# Image docker:git dùng Alpine Linux nên đường dẫn hiện tại là .
docker build -t $DOCKER_REPO ./my-project

echo "3. Pushing to Docker Hub..."
docker push $DOCKER_REPO

echo "4. Cleaning up..."
rm -rf my-project

echo "Done!"

# Lệnh chạy: ./builder.sh mluukkai/express_app zikar167/testing-script