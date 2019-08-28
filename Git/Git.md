## Git

#### DVCS - (분산)버전관리 시스템



### 기본 명령어

- git add
- git commit

- git config --global user.name 'username'
- git config --global user.email 'useremail'



### git 되돌리기

- commit 메시지 수정

  ```
  $git commit --amend
  ```

  - git bash에서 vim이 실행된다
  - 편집모드(i) 상태에서 수정후 esc + :wq
  - push, 즉 원격 저장소에 올린 이후에는 진행하면 충돌이 무조건 발생한다.
  - 커밋을 다시하게 되면 해시 값이 변경되기 때문!

  

- Staging area(INDEX)에서 취소하기

  ```bash
  $git reset HEAD 파일명
  ```

- git 이력에서 특정파일 삭제 커밓

  ```bash
  $git rm --cached 파일명
  ```

  - 한번도 커밋된 이력이 없을 때에는 staging area 에서 취소와 동일
  - 다만, 커밋에 포함된 적 있는 경우에는 삭제 커밋이 됨(실제 파일은 삭제되지 않음)

  

- 특정 파일 포함해서 다시 커밋

  ```bash
  $git add a.py
  $git commit -m 'a,b 추가'
  $git add b.py
  $git commit --amend
  ```

  - commit 메시지를 수정하기전에 staging area에 변경을 해주면, 해당 파일까지 포함하여 다시 커밋을 진행함.

  

- 현재 작업 내영 커밋 시점으로 되돌리기

  - 예를 들어, 특정 파일을 삭제하였거나 혹은 코드 수정과정에서 오류가 많이 발생하여 직전 커밋 시점 상태로 돌아가고 싶을 때 사용이 가능함

  ```bash
  $git checkout -- 파일명
  ```



## 원격 저장소(github) 활용하기

1. 원격 저장소 설정

   ```bash
   $ git remote add orgin {url}
   ```

2. 원격 저장소 확인

   ```bash
   $ git remote -v
   origin  https://github.com/youzung/TIL.git (fetch)
   origin  https://github.com/youzung/TIL.git (push)
   ```

3. 원격 저장소에 push

   ```bash
   $ git push origin master
   ```

4. 원격 저장소 삭제

   ```bash
   $ git remote rm origin
   ```

5. 원격 저장소 복제

   ``` bash
   $ git clone {url}
   ```

   - 로컬에 원격 저장소를 받아오고 싶다면, clone을 통해 가져온다
   - 이후에는 push -pull 을 통해서 업데이트하면 된다



## 충돌 해결하기(Merge conflict)

> 기본적으로  push -pull 하는 과정에서 동일한 파일의 다른 이력이 기록될 경우 충돌이 발생한다.
>
> 다른 파일이 수정되는 경우 fast-forwarding을 통해 자동으로 merge가 되기도 함!
>
> 이러한 오류를 발생시키지 않으려면, 항상 작업하기전에 pull을 확인하고, 작업 및 커밋을 한 이후에 push를 하는 것을 습관화 하자!



1. Local A에서 a.txt작성 후 커밋

2. Local A에서 원격저장소(Origin)로 push

3. Local B에서 pull 하지 않은 상태에서 a.txt동이라한 라인 작성 후 커밋

4. Local B에서 원격저장소(Origin)로 push -> push  되지 않음!

5. 해결(원격저장소 변경사한 Local B에서 반영)

   ```bash
   $ git pull origin master
   ```

6. 충돌 발생(동일 파일 수정시)

   - 어떤 파일에서 충돌되었는지 확인하는 명령어

   ``` bash
   $ git log --online --left-right--p
   ```

   - Git에서 직접 충돌 파일에 기록을 남겨줌

   ``` bash
   <<<<<<< HEAD
   집 수정 내용
   ============
   멀캠 수정 내용
   >>>>>>> 12dfas12sadf124fdsa
   ```

   - HEAD : 현재 작업하고 있는 곳 (Local B)
   - 해쉬값 : pull을 통해 받아온 변경사항(origin)
   - 해당 하는 위치를 찾아서 직접 수정을 하면 된다.

7. merge conflict해결 commit 남기기

   ``` bash
   $ git status
   $ git add .
   $ git commit -m 'Merge conflict 해결'
   ```

8. 원격 저장소로 push

   ``` bash
   $ git push origin master
   ```

   

### gitignore

- <http://gitignore.io/>
- git commit시 필요없는 파일들 커밋하지 않도록 해줌



### 참고

| 참고 사이트            |                                                              |
| ---------------------- | ------------------------------------------------------------ |
| git md 정리 내용       | <https://gist.github.com/edutak/0b3ec40bdecbc9bad074e8df1e5a7998> |
| git 입문편             | <https://backlog.com/git-tutorial/kr/intro/intro1_1.html>    |
| 기술 면접 가이드       | <https://github.com/JaeYeopHan/Interview_Question_for_Beginner> |
| 자율 출퇴근            | <https://github.com/milooy/remote-or-flexible-work-company-in-korea> |
| 커밋 메시지본문/명령문 | <https://meetup.toast.com/posts/106>                         |
| 커밋 낱말 사전         | <https://blog.ull.im/engineering/2019/03/10/logs-on-git.html> |
| git 시각화             | http://git-school.github.io/visualizing-git/                 |
| git emoji              | https://emoji.muan.co/                                       |