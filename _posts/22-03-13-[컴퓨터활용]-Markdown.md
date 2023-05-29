---
layout: post
title:  "[컴퓨터활용] Markdown"
date:   2022-03-13
banner_image: index-computing.png
tags: [컴퓨터활용]
---

[**Markdown**](http://whatismarkdown.com/)은 텍스트 기반의 마크업언어로 문서를 쉽고 빠르게 작성할 수 있게 합니다. 마크다운은 별도의 도구없이 간결하게 작성할 수 있고 웹 페이지, pdf등의 다양한 형태로 변환이 가능하며 텍스트(Text)로 저장되기 때문에 용량이 적어 보관이 용이합니다. 또한 지원하는 프로그램과 플랫폼이 다양하기 때문에 활용도가 매우 높습니다.

# #01. 마크다운 지원 VScode 익스텐션

| 익스텐션 | 개발자 | 설명 |
|---|---|---|
| Markdown All in One | Yu Zhang | 문법강조, 미리보기 기능 지원 |
| Markdown PDF | yzane | PDF 파일 변환 |
| Markdown Preview Github Styling | Matt Bierner(mattbierner.com) | Github 스타일의 미리보기 지원 |

## 1. 미리보기

`Cmd+Shift+P`를 눌러 명령창 호출 후 `markdown preview`로 검색하여 **Markdown: 미리보기 열기** 선택

## 2. PDF 변환

`Cmd+Shift+P`를 눌러 명령창 호출 후 `pdf`로 검색하여 **Markdown PDF: Export(pdf)** 선택

# #03. 마크다운 사용법

## 1. 헤더(Headers)

제목을 의미. `1~6`수준까지만 지원

#### 작성예시

```markdown
# This is a H1
# This is a H2
## This is a H3
### This is a H4
#### This is a H5
##### This is a H6
```

##### 💻 출력결과

# This is a H1
# This is a H2
## This is a H3
### This is a H4
#### This is a H5
##### This is a H6

## 2. BlockQuote (인용문)

이메일에서 사용하는 ```>``` 블럭인용문자를 이용한다.

#### 작성예시

```markdown
> This is a first blockqute.
```

##### 💻 출력결과

> This is a first blockqute.


## 3. 목록

### ● 순서있는 목록(번호)
순서있는 목록은 숫자와 점을 사용한다.

#### 작성예시

```markdown
1. 첫번째
2. 두번째
3. 세번째
```

##### 💻 출력결과

1. 첫번째
2. 두번째
3. 세번째

**현재까지는 어떤 번호를 입력해도 순서는 내림차순으로 정의된다.**

#### 작성예시

```markdown
1. 첫번째
1. 두번째
1. 세번째
```

##### 💻 출력결과

1. 첫번째
2. 두번째
3. 세번째


### ● 순서없는 목록(글머리 기호: `*`, `+`, `-` 지원)

#### 작성예시

```markdwon
* 빨강
  * 녹색
    * 파랑

+ 빨강
  + 녹색
    + 파랑

- 빨강
  - 녹색
    - 파랑
```

##### 💻 출력결과

* 빨강
  * 녹색
    * 파랑

+ 빨강
  + 녹색
    + 파랑

- 빨강
  - 녹색
    - 파랑


혼합사용도 가능하다

#### 작성예시

```markdown
* 1단계
  - 2단계
    + 3단계
      + 4단계
```

##### 💻 출력결과

* 1단계
  - 2단계
    + 3단계
      + 4단계

## 4. 코드

코드블럭코드("\`\`\`") 시작점에 사용하는 언어를 선언

#### 작성예시

<pre>
<code>
```java
public class BootSpringBootApplication {
  public static void main(String[] args) {
    System.out.println("Hello, Honeymon");
  }
}
```
</code>
</pre>

##### 💻 출력결과

```java
public class BootSpringBootApplication {
  public static void main(String[] args) {
    System.out.println("Hello, Honeymon");
  }
}
```


## 5. 수평선 `<hr/>`

아래 줄은 모두 수평선을 만든다. 마크다운 문서를 미리보기로 출력할 때 *페이지 나누기* 용도로 많이 사용한다.

#### 작성예시

```markdown
* * *

***

*****

- - -

---
```

##### 💻 출력결과

* * *

***

*****

- - -

---


## 6. 링크

```
사용문법: [Title](link)
```

#### 작성예시

```markdown
적용예: [Google](https://google.com)
```

##### 💻 출력결과

Link: [Google](https://google.com)


## 7. 강조

#### 작성예시

```markdown
*single asterisks*
**double asterisks**
~~cancelline~~
```

##### 💻 출력결과

* *single asterisks*
* **double asterisks**
* ~~cancelline~~

> ```문장 중간에 사용할 경우에는 **띄어쓰기** 를 사용하는 것이 좋다.```   
> 문장 중간에 사용할 경우에는 띄어쓰기를 사용하는 것이 좋다.


## 8. 이미지

사이즈 조절 기능은 없다.

#### 작성예시

```markdown
![컴퓨팅](/images/posts/2022/index-computing.png)
```

##### 💻 출력결과

![컴퓨팅](/images/posts/2022/index-computing.png)


# #04. 과제물 제출 양식

아래 소스코드 양식을 기반으로 markdown으로 작성 후 VSCode의 PDF 변환 기능을 사용하여 제출.

#### 작성예시

<pre>
<code>
# 이광호 OOO과제 

> 2021-01-19

# 문제1

```javascript
const name = req.body.name;

if (name === undefined) {
    console.log('이름이 없습니다.');
}
```

실행결과의 스크린샷


# 문제2


```javascript
const name = req.body.name;

if (name === undefined) {
    console.log('이름이 없습니다.');
}
```

실행결과의 스크린샷
</code>
</pre>


##### 💻 출력결과

![과제양식](/images/posts/2022/0313/pdf.png)

---

# 참고문헌

- [Kim, Ji-Heon. “마크다운(Markdown) 사용법,” March 13, 2022. https://gist.github.com/ihoneymon/652be052a0727ad59601](https://gist.github.com/ihoneymon/652be052a0727ad59601)