# 1. 베이스 이미지 선택
# nvidia가 제공하는 pytorch 이미지를 사용합니다. CUDA, Python 등이 미리 설치되어 있습니다.
FROM nvcr.io/nvidia/dgl:24.05-py3

# 2. 컨테이너 안의 작업 폴더 설정
WORKDIR /app

# 3. requirements.txt 파일을 먼저 복사
# (나중에 코드만 수정될 경우, 이 부분은 캐시를 사용해 빌드 속도가 빨라집니다.)
COPY requirements.txt .

# 4. 파이썬 패키지 설치
RUN pip install --no-cache-dir -r requirements.txt

# 5. 현재 폴더의 모든 파일(코드 등)을 컨테이너의 /app 폴더로 복사
COPY . .

# 6. Jupyter Notebook이 사용할 포트를 외부에 알림
EXPOSE 8888

# 7. 컨테이너가 시작될 때 실행할 기본 명령어 설정
# Jupyter Notebook을 외부에서 접속 가능하도록 실행합니다.
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
