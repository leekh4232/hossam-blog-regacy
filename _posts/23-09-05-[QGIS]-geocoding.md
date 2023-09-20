---
layout: post
title: "[QGIS] (Lab04)-Geocoding(지오코딩)"
date: 2023-09-05
banner_image: index-qgis.png
tags: [QGIS]
---

지오코딩이란 주소에서 지리정보를 추출하는 과정을 말합니다.

<!--more-->

# #01. Geocoding 개요

좌표계를 갖지 않는 문자열 형식의 주소를 수치형태로 만들 때 사용함

QGIS에는 한글 주소를 지오코딩하는 기능이 없기 때문에 외부 프로그램이나 API를 활용해야 한다.

# #02. X-ray map

민간 GIS 분석회사인 `biz-gis.com`에서 재작하여 무료로 배포하는 프로그램.

한 번에 변환할 수 있는 양이 100개 까지로 한정되어 있기 때문에 100개 이상을 처리해야 하는 경우 분할 작업이 필요하다.

