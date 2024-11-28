---
layout: post
title:  "[Mac] 개발서버 구축기 (4) - MariaDB 설치"
date:   2024-07-25
banner_image: index-mac-studio.jpg
tags: [Mac]
---

mariaDB는 MySQL 서버에서 사용되던 데이터 파일들이 서로 호환된다. MySQL Connector(Java 및 C 클라이언트 라이브러러 등)는 모두 MariaDB에서 변경없이 사용 가능하기 때문에 MySQL 클라이언트 프로그램은 그대로 MariaDB 서버의 연결에 사용할 수 있다. MariaDB와 MySQL은 기능이나 성능에서 큰 차이점을 보이지는 않는다. MySQL은 오라클이 MariaDB는 Monty Program AB가 이끌고 있으므로 앞으로 점점 차이점이 두드러지겠지만 현재까지는 거의 동일하다고 봐도 좋다. 그래서 이번 개발 머신에는 MariaDB를 설치해 보았다.

<!--more-->

# #01 Maria DB 설치

Homebrew를 통해 설치한다.

```shell
$ brew install mariadb
```

# #02. 서비스 등록 및 삭제

## 1. 서비스 등록하기

```shell
$ brew services start mariadb
```

## 2. 서비스 등록 해제

```shell
$ brew services stop mariadb
```

## 3. 서비스 시작하기

```shell
$ mysql.server start
```

# #03. 기본 설정 시작

```shell
$ sudo mysql_secure_installation
```