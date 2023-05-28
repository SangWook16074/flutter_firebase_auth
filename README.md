# flutter_firebase_auth

Flutter 프로젝트에서 Firebase Auth를 사용하는 예제 로그인 앱입니다.

-----------


## 프로젝트 구조


 
-----------

## components

프로젝트에서 사용한 2가지의 컴포넌트가 있습니다. 그라데이션색상의 버튼과 텍스트 필드입니다.

## ui

로그인화면, 회원가입화면, 메인화면으로 구성되어 있습니다.


## 프로젝트 기능 요약

Firebase Auth를 이용해서 회원가입, 로그인, 로그아웃 기능을 구현한 프로젝트입니다.

### 로그인 화면

<img src=https://github.com/SangWook16074/flutter_firebase_auth/assets/108314973/7db5ee00-051e-4bb1-a6f4-4a5a2e7a7709 width=250px>

### 회원가입 화면

<img src=https://github.com/SangWook16074/flutter_firebase_auth/assets/108314973/f14371c1-ff4e-40ef-8f41-53825a8d60cc width=250px>

### 홈 화면

<img src=https://github.com/SangWook16074/flutter_firebase_auth/assets/108314973/9daccdb0-2ac0-4f30-a16f-07301205389a width=250px>

### 프로젝트 기능

Firebase Auth를 이용해서 간단한 회원가입, 로그인, 로그아웃에 대한 예제입니다.

![auth](https://github.com/SangWook16074/flutter_firebase_auth/assets/108314973/7470c212-db38-4bf6-b46a-ecf969db3f0a)

## 함수 소개
* 회원가입 관련 함수
- signUp()
    텍스트 입력값을 이용해서 새로운 계정을 생성합니다. 비밀번호가 너무 간단하거나, 이미 존재하는 이메일이라면 계정이 생성되지 않습니다.

* 로그인 관련 함수
- signIn()
    텍스트 입력값을 이용해서 로그인하는 함수입니다. 로그인에 성공하면, StreamBuilder를 통해서 페이지가 이동합니다.

* 로그아웃 함수
- signOut()
    현재 로그인되어있는 상태를 로그아웃합니다.