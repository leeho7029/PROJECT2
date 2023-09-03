# PROJECT2-국영수 서적판매사이트


## 프로젝트 개요
"국영수" 라는 가상 기업을 주제로 웹 프로젝트를 설계하였습니다. 프론트엔드 부분은 설계 시에는 페이퍼 프로토타입으로 사용성을 테스트 하였고, html과 css, javascript로 작성하고, 백엔드 부분은 jsp의 디렉티브, jquery, 서블릿 등을 활용하여 기업형 데스크탑 웹 애플리케이션을 작성하였습니다. 해당 프로젝트는 회원기능인 회원가입, 로그인, 로그아웃, 회원 정보 확인, 회원 정보 수정, 회원 탈퇴, 회원의 게시판 글 목록, 글 상세보기, 글 등록, 글 수정, 글 삭제, 댓글의 등록, 삭제, 파일 업로드, 결제, 트랜잭션 등의 기능을 구현하였으며, 관리자는 일반 회원의 관리기능인 회원내역 및 글 관리 기능 등을 구현하였습니다.

## 💻기술 스택
<img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> 
<img src="https://img.shields.io/badge/mariaDB-003545?style=for-the-badge&logo=mariaDB&logoColor=white"> <img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white"> <img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white"> 
<img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white"> <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white"> <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white"> 

## 📝프로젝트 설계
### 개념적 설계
![pro02 UCD](https://github.com/leeho7029/PROJECT2/assets/80402477/49ba4099-1302-4fee-939d-b77cdc0b076f)


### 논리적 설계
![logicalerd](https://github.com/leeho7029/PROJECT2/assets/80402477/e6c9a15c-d8f8-4b3e-89b3-104c0e402ba4)


### 물리적 설계
![01](https://github.com/leeho7029/PROJECT2/assets/80402477/bf6df70d-cb20-4e5d-a08f-eba431551f40)
![13](https://github.com/leeho7029/PROJECT2/assets/80402477/323a06a9-c15c-4e4a-85fa-aa62b0a81600)
![12](https://github.com/leeho7029/PROJECT2/assets/80402477/aec3b7af-a07a-4f7e-87a7-133d0b5bd3ba)
![11](https://github.com/leeho7029/PROJECT2/assets/80402477/6f8923ff-e11e-4c55-86d1-cefcd36aae93)
![10](https://github.com/leeho7029/PROJECT2/assets/80402477/049d1a70-91ed-450e-984f-ab3dce6ba749)
![09](https://github.com/leeho7029/PROJECT2/assets/80402477/a4265967-ea79-434b-9960-34df6737efd9)
![08](https://github.com/leeho7029/PROJECT2/assets/80402477/5d53536b-858b-4b62-8c0b-de738f92d834)
![07](https://github.com/leeho7029/PROJECT2/assets/80402477/f8c83416-b489-4b2e-9342-78e50a598196)
![06](https://github.com/leeho7029/PROJECT2/assets/80402477/348ac62d-42aa-4dc8-b2f1-d73819743775)
![05](https://github.com/leeho7029/PROJECT2/assets/80402477/0e3d85c8-fe4f-44a8-ab21-f91c354f05f2)
![04](https://github.com/leeho7029/PROJECT2/assets/80402477/fce4c43d-c7bb-4687-9724-d1216a00d014)
![03](https://github.com/leeho7029/PROJECT2/assets/80402477/faac1463-50fa-4d73-9dde-7050f15c505e)
![02](https://github.com/leeho7029/PROJECT2/assets/80402477/40512d7e-1592-4daf-96db-3335cbc8a468)
![14](https://github.com/leeho7029/PROJECT2/assets/80402477/3750801b-2ca5-4bfc-8211-bb061e94c566)


### 클래스 다이어그램
![class1](https://github.com/leeho7029/PROJECT2/assets/80402477/8e5780c5-28f6-4bb2-bffc-29fafe2085f9)
![class2](https://github.com/leeho7029/PROJECT2/assets/80402477/b6b7ff88-a234-450e-9066-5e3baddce75e)


### ERD 다이어그램
![image](https://github.com/leeho7029/PROJECT2/assets/80402477/feba933d-5d95-4395-a398-8fc45e508cfc)
![image(1)](https://github.com/leeho7029/PROJECT2/assets/80402477/efa140b8-1bd2-4fcc-a38b-582db5fa4a51)
![image (3)](https://github.com/leeho7029/PROJECT2/assets/80402477/a1b6e5be-bef4-4102-873e-cd28c6c7dbad)
![image (2)](https://github.com/leeho7029/PROJECT2/assets/80402477/8470caea-c528-4c49-a62a-39f782e4b072)


### 시퀀스 다이어그램

![project2 member 시퀀스 drawio](https://github.com/leeho7029/PROJECT2/assets/80402477/3bc93055-7c02-422b-83f9-8c352c23d009)
![project2 Fileupload 시퀀스 drawio](https://github.com/leeho7029/PROJECT2/assets/80402477/df7bb1d3-999d-4054-a8a4-0cf7cf12939e)
![project2 Qna 시퀀스 drawio](https://github.com/leeho7029/PROJECT2/assets/80402477/b4a54f62-3700-4f8e-9500-d69965e46ff4)
![project2 product pay delivery 시퀀스 drawio](https://github.com/leeho7029/PROJECT2/assets/80402477/568f3f38-0596-4fbf-9f3f-a7ece7c729c8)
![project2 Notice 시퀀스 drawio](https://github.com/leeho7029/PROJECT2/assets/80402477/8f7a261d-7f48-4e2e-b511-f464a8dc2b8c)

### 페이지 기능
![image](https://github.com/leeho7029/PROJECT2/assets/80402477/383a0116-5251-4c3a-82be-82c9ffde919b)
![image](https://github.com/leeho7029/PROJECT2/assets/80402477/f721f1e6-3dd9-445b-87de-6e6819e1984e)
![image](https://github.com/leeho7029/PROJECT2/assets/80402477/37ce1f8e-8a02-469c-a3ad-62ed6c6e3b92)
![image](https://github.com/leeho7029/PROJECT2/assets/80402477/22d8d654-08c5-4bec-80d2-bdc460ed2db1)
![image](https://github.com/leeho7029/PROJECT2/assets/80402477/0a75ba07-57dc-41ba-8d07-a864cf592806)
![image](https://github.com/leeho7029/PROJECT2/assets/80402477/46ccda20-113c-4280-b742-d7d3398ce9ef)
![image](https://github.com/leeho7029/PROJECT2/assets/80402477/5c93720e-e918-420a-9fd9-8c8429f567d8)
![image](https://github.com/leeho7029/PROJECT2/assets/80402477/bc064a67-b468-488e-9092-beb306196a2a)
![image](https://github.com/leeho7029/PROJECT2/assets/80402477/f30d8be1-11b6-4449-9a18-a2625da49bcf)
![image](https://github.com/leeho7029/PROJECT2/assets/80402477/f2819a47-d464-4018-af76-fad7b2cb26eb)
![image](https://github.com/leeho7029/PROJECT2/assets/80402477/ff5fc059-dc85-44b6-99d1-39f334fd0543)
![image](https://github.com/leeho7029/PROJECT2/assets/80402477/608bc09e-1029-4298-9ee6-0fe051bb36e4)
![image](https://github.com/leeho7029/PROJECT2/assets/80402477/8d9c8cbb-a623-49d2-8796-b8e939d90fe6)
![image](https://github.com/leeho7029/PROJECT2/assets/80402477/f7fd61da-3352-4324-9cc8-705b1b0a4ce3)
![image](https://github.com/leeho7029/PROJECT2/assets/80402477/dcc2e5f4-5a99-404b-a290-e4054041f076)
![image](https://github.com/leeho7029/PROJECT2/assets/80402477/24504d33-dd65-4830-ad21-5e4060b693af)
![image](https://github.com/leeho7029/PROJECT2/assets/80402477/01d8204f-6593-4552-94f1-1ccab60636b4)
![image](https://github.com/leeho7029/PROJECT2/assets/80402477/e3ea5958-67b7-4443-b93c-adabc4d991a8)
![image](https://github.com/leeho7029/PROJECT2/assets/80402477/aecc7853-b319-4cdd-b66c-949d584930a3)
![image](https://github.com/leeho7029/PROJECT2/assets/80402477/5082a57f-5e15-452e-b6e3-ca8c17baf5e9)
![image](https://github.com/leeho7029/PROJECT2/assets/80402477/d0c48a89-38a7-446f-aa0e-35d9888da346)
![image](https://github.com/leeho7029/PROJECT2/assets/80402477/416c63fd-60e6-48cc-82bd-ffe29050513e)
![image](https://github.com/leeho7029/PROJECT2/assets/80402477/bd974d25-6e09-47a5-9e79-efb8fa8d1bbe)






