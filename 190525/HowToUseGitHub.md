## GitHub 기본 사용법 정리

특강을 통해서 사용법을 배웠지만 아무래도 헷갈려서 다시 정리하기!

- git bash [설치하기](<https://git-scm.com/downloads>)



### 명령어

- 처음으로 github 설정하기

      $ git config --global user.name "your_name"
      $ git config -- global user.email "yourEmail@Example.com"


- 새로운 로컬저장소 만들기

      $ cd C:\TIL       // 로컬 저장소로 사용할 디렉토리
    
      $ git init   	    //  (master) 붙으면 성공!
      $ rm -r .git	   //  init 취소하기


- 로컬저장소의 현재 상태 확인하기

      $ git status


- 파일을 준비영역으로 옮기기

      $ git add a.md    // a.md 파일만 옮기기
    
      $ git add .    // 디렉토리 내의 모든 파일 추가하기


- 준비영역의 파일을 로컬저장소에 저장하기

      $ git commit         //에디터에서 커밋 메시지 입력 후 저장
    
      $ git commit - m "커밋메시지"   // 커밋 메시지 입력 후 커밋


- 로컬 저장소와 깃허브 g저장소 연결하기

      $ git remote add origin https://github.com/youzung/TIL

- 연결 상태 확인하기

      $ git remote -v

- 깃허브로 푸시하기

      $ git push -u origin master   //원격 저장소에 저장
      $ git pull origin master   // 에러 -![rejected] master -> master (fetch first) 
      $ git push origin +master  // 에러 -! [rejected] master -> master (non-fast-forward)
  
   
  
   

[참고한 블로그](https://gbsb.tistory.com/10)