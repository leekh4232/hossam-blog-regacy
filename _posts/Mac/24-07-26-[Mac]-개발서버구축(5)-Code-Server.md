---
layout: post
title:  "[Mac] 개발서버 구축기 (5) - Code Server"
date:   2024-07-26
banner_image: index-mac-studio.jpg
tags: [Mac]
---

`http`가 아닌 `https`로의 접근을 위해서는 SSL 인증서를 발급받는 과정이 필요하다. 대부분의 경우 SSL 인증서는 유료로 진행되지만 `Let's Encrypt`를 사용하면 무료로 인증서를 발급받을 수 있다.

<!--more-->

# #01. 인증서 발급 준비

## 1. 인증서 작업을 위한 디렉토리 생성

대부분의 가이드에서는 기본 경로를 사용하지만 그럴 경우 인증서를 사용하는 모든 서버들이 관리자 권한으로 실행되어야 한다. 하지만 맥의 HTTP 서버는 사용자 권한으로 실행되기 때문에 기본 경로를 사용하면 HTTP 서버에 SSL 인증서를 연결할 수 없게 된다.

```shell
$ mkdir ~/.ssl
```

## 2. Certbot 설치

Homebrew를 사용해 macOS에 Certbot을 설치한다.

```shell
$ brew install certbot
```

# #02. 인증서 발급 받기

## 1. HTTP 서버 설정

여기서는 Certbot의 `--webroot` 플러그인을 사용한다. 이 플러그인은 웹서버가 실행 중인 상태에서 인증서를 발급받을 수 있게 해준다. 즉, HTTP 서버 설정이 완료된 후에 이 작업을 해야 한다.

`Let's Encrypt`는 무료이기는 하지만 월단위로 갱신해야 한다는 단점이 존재하는데, 대부분 `crontab`을 사용하여 자동 갱신되도록 설정한다. `--webroot` 플러그인을 사용하지 않으면 이 자동 갱신 기능을 사용할 수 없기 때문에 웹 서버 설정은 필수라 할 수 있겠다.

## 2. 인증서 발급

Certbot을 실행하고 웹 루트 디렉토리를 지정하여 인증서를 발급받는다.

### 명령 형식

```shell
$ certbot certonly -d 도메인 --webroot -w 웹서버_루트_디렉토리_경로 --cert-path 인증서_저장_경로 --work-dir 작업경로 --logs-dir 로그파일이_저장될_경로 --config-dir 설정파일이_저장될_경로  [--dry-run]
```

온라인의 자료를 참고해서 `--menaul` 옵션을 부여했을 때도 자동 갱신이 되지 않으므로 이 옵션은 사용하지 않는다.

웹 루트 디렉토리는 웹 서버에서 호스팅하는 파일들이 위치한 디렉토리이다. 예를 들어, 아파치 웹서버의 경우 기본 웹 root 디렉토리는 `/Library/WebServer/Documents/`일 수 있다. 나는 HTTP 서버의 root 디렉토리를 `~/workspace-php`로 설정했다.

그 밖에 각종 디렉토리 경로를 일일이 지정해 주고 있는데, 기본 디렉토리를 사용할 경우 `sudo` 명령을 사용하여 관리자 권한으로 실행해야 한다. 이렇게 되면 사용자 계정으로 실행되는 서버(ex: HTTP서버, jupyter 서버 등)은 인증서를 사용할 수 없게 되므로 모든 작업 디렉토리를 사용자 계정 안으로 설정해주자.

마지막의 `--dry-run`은 테스트만 하고자 할 경우 사용한다.


### 실제 적용



```shell
$ certbot certonly -d home.hossam.kr --webroot -w /Users/leekh/workspace-php --cert-path /Users/leekh/.ssl --work-dir /Users/leekh/.ssl --logs-dir /Users/leekh/.ssl --config-dir /Users/leekh/.ssl [--dry-run]
```


```shell
certbot renew --webroot -w /Users/leekh/workspace-php --cert-path /Users/leekh/.ssl --work-dir /Users/leekh/.ssl --logs-dir /Users/leekh/.ssl --config-dir /Users/leekh/.ssl --dry-run
```


여기서 /path/to/your/webroot는 웹 루트 디렉토리의 경로이고, yourdomain.com과 www.yourdomain.com은 인증서를 발급받으려는 도메인이다.
필요에 따라 이 값들을 변경하면 된다.



Apache 설정 업데이트: 인증서가 발급되면 아파치 웹서버의 설정을 업데이트해야 한다.
SSL 설정은 일반적으로 httpd-ssl.conf 파일에 저장되어 있다.
이 파일을 열고 다음과 같이 설정한다.

bash

SSLEngine on SSLCertificateFile /etc/letsencrypt/live/yourdomain.com/fullchain.pem SSLCertificateKeyFile /etc/letsencrypt/live/yourdomain.com/privkey.pem
yourdomain.com은 인증서를 발급받은 도메인으로 변경한다.



Apache 재시작: 설정을 업데이트한 후 아파치를 재시작하여 새로운 설정을 적용한다.


sudo apachectl restart
자동 갱신 설정: Let's Encrypt 인증서는 90일마다 갱신해야 한다.
crontab을 사용해 자동 갱신을 설정할 수 있다.


crontab -e
그리고 다음 줄을 추가한다 (매일 새벽 2시에 인증서를 갱신하도록 설정):

javascript

0 2 * * * /usr/local/bin/certbot renew --quiet --renew-hook '/usr/sbin/apachectl graceful'
이렇게 설정하면 Certbot이 자동으로 인증서를 갱신하고, --renew-hook 옵션에 의해 아파치 서버가 재시작되어 새 인증서를 적용하게 된다.
이 때, graceful 옵션은 현재 연결을 중단하지 않고 아파치를 재시작하게 해준다.

테스트: 모든 설정이 완료되면 웹 브라우저를 통해 https://yourdomain.com에 접속하여 SSL이 제대로 작동하는지 확인한다.
브라우저의 주소창에서 자물쇠 아이콘이 표시되어야 하며, 클릭하면 Let's Encrypt로부터 발급받은 인증서 정보를 볼 수 있어야 한다.



보안 강화: 추가적으로, 웹서버의 보안을 강화하기 위해 HSTS(Strict Transport Security) 설정을 추가하는 것을 고려해볼 수 있다.
이 설정은 브라우저에게 이 사이트가 항상 HTTPS를 통해 접속되어야 함을 알려줍니다.
아파치 설정 파일에서 다음 줄을 추가한다.

vbnet

Header always set Strict-Transport-Security 'max-age=31536000; includeSubDomains; preload'
이 설정은 1년 동안(HSTS max-age) 이 도메인과 모든 서브도메인이 HTTPS를 사용하도록 브라우저에 지시한다.
이 설정을 추가한 후 아파치를 다시 재시작해야 한다.

이렇게 하면 Let's Encrypt 인증서를 사용해 아파치 웹서버를 HTTPS로 전환하는 과정이 완료됩니다.
이제 사용자는 안전하게 웹사이트를 방문할 수 있다.