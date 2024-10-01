





# #10. Jupyter Server 구성

## 1. JupyterLab 설치

파이썬을 설치한 후 jupyter를 설치했다.

```shell
$ pip3 install jupyter
```

## 2. Jupyter Server 설정

### (1) 비밀번호 생성

아래 명령으로 비밀번호를 생성한다.

```shell
$ jupyter lab password
```

##### 출력결과

아래와 같이 비밀번호를 두 번 입력받는다. 그 후 비밀번호가 기입된 파일의 경로가 표시된다.

```shell
Enter password: ****
Verify password: ****
[JupyterPasswordApp] Wrote hashed password to /Users/leekh/.jupyter/jupyter_server_config.json
```

### (2) 비밀번호 확인

생성된 파일을 열어 비밀번호를 확인한다. 입력한 값이 암호화 되어 있습니다.

이 값을 설정파일에 기입해야 합니다.

```shell
$ cat /Users/leekh/.jupyter/jupyter_server_config.json
```

##### 출력결과

`hashed_password`의 값을 따옴표 없이 복사한다.

```shell
{
  "IdentityProvider": {
    "hashed_password": "...암호화된 비밀번호..."
  }
}
```


### (3) 설정파일 생성

아래 명령으로 설정 파일을 생성합니다.

```shell
$ jupyter lab --generate-config
```

##### 출력결과

아래와 같이 생성된 설정파일의 위치가 출력됩니다.

```shell
Writing default config to: /Users/leekh/.jupyter/jupyter_lab_config.py
```

### (2) 설정파일 수정

vi 에디터로 설정파일을 편집한다.

```shell
$ code ~/.jupyter/jupyter_lab_config.py
```

#### 편집 내용

아래 항목들을 찾아서 값을 변경한다.

```py
# 서버 서비스 아이피 (모든 아이피 허용)
c.ServerApp.ip = '*'

# 서비스 가동시 브라우저 오픈 금지
c.ServerApp.open_browser = False

# jupyter_server_config.py 에서 복사한 비밀번호
c.ServerApp.password = "... 비밀번호 ..."

# 서비스 포트번호
c.ServerApp.port = 9904

# jupyter 가동시 root 디렉토리
c.ServerApp.root_dir = '/Users/leekh/workspace-notebook'
```

## 3. 서비스 구동

### (1) 서비스 구동 정보 파일 생성

`~/Library/LaunchAgents/jupyter.server.plist` 파일을 생성하고 아래의 내용을 작성한다.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>KeepAlive</key>
    <true />
    <key>RunAtLoad</key>
    <true/>
    <key>Label</key>
    <string>com.jupyter.server</string>
    <key>ProgramArguments</key>
    <array>
      <!-- jupyter 실행 파일 경로 -->
      <string>/Users/leekh/.pyenv/shims/jupyter</string>
      <string>lab</string>
      <string>--no-browser</string>
    </array>
  </dict>
</plist>
```

### (2) 설정파일 로드

앞에서 생성한 서비스 구동 정보 파일을 로드한다.

```shell
$ launchctl load ~/Library/LaunchAgents/jupyter.server.plist
```

### (3) 서비스 가동 / 중지

#### 서비스 시작

부팅시 자동으로 서비스가 시작된다.

```shell
$ launchctl start com.jupyter.server
```

#### 서비스 중지

부팅시 자동으로 시작되지 않는다.

```shell
$ launchctl stop com.jupyter.server
```

# #11. PHP 개발환경 구성

## [1] Apache 및 PHP 설치

이 내용은 이미 이전에 정리한적이 있어서 해당 내용을 참고했다.

설치 과정에서 port 번호를 80번이 아닌 `9902`로 설정했고, DocumentRoot의 경로는 VirtualHost를 설정할 것이므로 기본 경로를 그대로 두었다.

[[Mac] MacOS에 PHP 설치 (8.3)](2024/02/17/Mac-PHP%EC%84%A4%EC%B9%98/)

## [2] Composer 설치

PHP 개발을 하려면 Composer가 필요하다.

이 역시 이전에 정리를 해 둔 글이 있어서 참고했다.

[[PHP] MacOS에 컴포저 설치 (8.3.2)](/2024/05/07/PHP-MacOS%EC%97%90-%EC%BB%B4%ED%8F%AC%EC%A0%80%EC%84%A4%EC%B9%98/)

## [3] Virtual Host 설정

다음의 포스팅에 Virtual Host 설정을 정리해 둔 글이 있어서 참고했다.

포트번호는 9902번으로 설정했으며, Cafe24를 통해서 실제 도메인을 집 아이피로 연결해 두었기 때문에 가상 도메인은 설정하지 않았다.

[[Mac] MacOS의 httpd Virtual Host 설정](/2024/02/20/Mac-httpd-vhosts%EC%84%A4%EC%A0%95/)

# #12. SSL 인증서 발급 및 설정(jupyter, httpd)

# #13. MariaDB