# git 개념과 작업 흐름

## git이란?
- 분산 버전 관리 시스템, 파일 이력관리 시스템

## git 작업 흐름
[로컬 작업 디렉토리]
↓ git add
[로컬 스테이징 영역]
↓ git commit
[로컬 저장소]
↓ git push
[원격 저장소]

## git 명령어

### git init
- git 저장소 초기화, git으로 관리 시작
- 현재 폴더를 git 이 관리할 수 있는 저장소로 바꿔주는 명령어
- 폴더 안에 있는 파일들을 추적하겠다는 의미
- .git 폴더 생성
- github 연결은 하지 않은 상태

### git clone
- 로컬로 복사
- 복사만 하고 원본은 그대로

### git add .
- 변경된 모든 파일을 스테이징 영역에 추가

### git add 파일명
- 파일명에 해당하는 파일을 스테이징 영역에 추가

### git commit -m "커밋메세지"
- 변경된 파일을 로컬 저장소에 추가

### git status
- git이 어떤 파일을 추적하고 있는지 상태확인

### git log
- 현재 브랜치(head)의 커밋 이력 확인하기

### git remote
- 원격 저장소 정보 확인 및 설정

### git remote -v
- 원격 저장소 url 포함 정보 보기

### git remote add origin url 
- 로컬 저장소를 github 에 있는 원격 저장소와 연결

### git remote remove origin
- 원격 연결 제거(끊기)

### git remote -v 
- 어떤 내용이 등록되어 있는지 보기만 하는 것

### git reset
- git의 포언터를 이전 커밋으로 돌림
- 주로 내가 보고있는 커밋(HEAD)를 가리킴

### git fetch
- 원격 저장소에서 최신 커밋 정보들만 가져와서 로컬 저장소에 복사
- 작업 브랜치에는 영향을 주지 않음

### git merge
- 브랜치를 비교하고 통합

### git pull
- git fetch + git pull

### fork
- 다른 사람의 원격 저장소 전체를 내 github 계정으로 복사해서 내 저장소처럼 독립적으로 사용할 수 있게 함
- 로컬이 아닌 github 웹에서 발생하는 동작
- github 상에서 새로운 저장소가 생성됨
- 오픈소스에 기여

### git checkout
- git 브랜치 전환

---------------

## git commit convenstion
- feat: feature 새로운 기능 추가
- fix: 버그 수정
- docs: documentation 문서만 수정(readme 등)
- style: 코드 포맷팅, 세미콜론 유무 등 모양만 바꾼 커밋 논리적 변경 없음
- refactor: 리팩토링(기능변화없음), 기능은 변화가 없지만 코드 구조, 이름, 로직 흐름을 개선하는 작업(예: 중복함수 제거, 변수명 개선 등)
- test: 테스트 코드 추가
- chore: 빌드, 설정, 패키지 등 잡일성 변경