Markdown

# RF-Docker Project

단백질 구조 예측 및 설계를 위한 RFdiffusion, ProteinMPNN 등의 모델을 Docker 환경에서 실행하는 프로젝트입니다.

---

## ✅ 시작하기 (Getting Started)

이 프로젝트를 실행하기 위해 필요한 환경을 Docker로 구축하고 실행하는 방법입니다. 서버에 NVIDIA 드라이버와 Docker가 설치되어 있어야 합니다.

### 1. GitHub 레포지토리 클론

터미널을 열고 아래 명령어를 실행하여 프로젝트 파일을 내려받습니다.

```bash
git clone [https://github.com/schoyeon/rfdocker.git](https://github.com/schoyeon/rfdocker.git)
cd rfdocker
2. Docker 이미지 빌드
프로젝트 폴더 안의 Dockerfile을 기반으로 Docker 이미지를 생성합니다. -t 옵션으로 이미지 이름을 rf-project로 지정합니다.

Bash

docker build -t rf-project .
3. Docker 컨테이너 실행
생성된 이미지를 컨테이너로 실행합니다. GPU를 사용하고, Jupyter Notebook을 위한 포트를 연결하며, 현재 폴더를 컨테이너와 동기화합니다.

Bash

docker run -it --gpus all -p 8888:8888 --name my-rf-container -v $(pwd):/app rf-project
--name my-rf-container: 컨테이너에 이름을 붙여두면 나중에 docker start my-rf-container 와 같이 관리하기 편합니다.

-v $(pwd):/app: 현재 서버 폴더와 컨테이너의 /app 폴더를 실시간으로 동기화합니다. 서버에서 코드를 수정하면 바로 컨테이너에 반영됩니다.

4. Jupyter Notebook 접속
컨테이너가 실행되면 터미널에 아래와 같은 URL이 출력됩니다. 이 주소 전체를 복사하여 웹 브라우저에 붙여넣으면 Jupyter Notebook에 접속할 수 있습니다.

http://127.0.0.1:8888/?token=a1b2c3d4e5f6...
