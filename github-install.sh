#!/bin/bash

# 최신 깃허브 버전 정보 가져오기
latest_version=$(curl -s https://api.github.com/repos/git/git/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

# 깃허브 패키지 다운로드 및 설치를 위한 스크립트

# 깃허브 패키지 정보
github_version="${latest_version}" # 최신 버전으로 업데이트됩니다.
download_url="https://github.com/git/git/archive/v${github_version}.tar.gz"

# 설치 경로
install_path="/usr/local" # 원하는 설치 경로로 변경 가능합니다.

# 의존성 확인 (git, curl, tar)
if ! command -v git >/dev/null 2>&1 || ! command -v curl >/dev/null 2>&1 || ! command -v tar >/dev/null 2>&1; then
  echo "git, curl, tar를 설치해주세요."
  exit 1
fi

echo "깃허브 설치를 시작합니다..."

# 임시 디렉토리 생성
temp_dir=$(mktemp -d)

# 깃허브 패키지 다운로드
echo "깃허브 다운로드 중..."
curl -L "${download_url}" -o "${temp_dir}/github.tar.gz"

# 압축 해제
echo "깃허브 압축 해제 중..."
tar -xzf "${temp_dir}/github.tar.gz" -C "${temp_dir}"

# 빌드 및 설치
echo "깃허브 빌드 및 설치 중..."
cd "${temp_dir}/git-${github_version}"
make prefix="${install_path}" all
sudo make prefix="${install_path}" install

# 임시 디렉토리 정리
echo "깃허브 설치를 완료했습니다."
rm -rf "${temp_dir}"

# 깃 설정
echo "깃 설정을 진행합니다."
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

echo "깃허브 설치가 완료되었습니다!"
