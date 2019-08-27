## EXECUTE, EXECUTEQUERY, EXECUTEUPDATE 차이점

### Execute

- 수행결과 : Boolean
- 모든 구문 수행 가능

- 리턴값이 ResultSet일 경우에는 true, 이 외의 경우는 false
- ResultSet객체에 결과 담을 수 없음



### ExecuteQuery

- 수행 결과 : ResultSet객체의 값 반환
- SELECT 구문에 사용



### ExecuteUpdate

- 수행 결과 : int 타입의 값을 반환
- INSERT/DELETE/UPDATE 관련 구문 : 반영된 레코드의 건수 반환
- CREAET/DROP 관련 구문 : -1반환



---

## STATEMENT, PREPARESTATEMENT 차이점

### Statement

- 단일로 사용될 때 빠른 속도를 지닌다.
- 쿼리에 인자를 부여할 수 없다.
- 매번 컴파일을 수행해야 한다.



### PrepareStatement

- 쿼리에 인자를 부여할 수 있다.
- 처음 프리컴파일 된 후, 이후에는 컴파일을 수행하지 않는다.
- 여러번 수행될 떄 빠른 속도를 지닌다.



> [참고](https://mozi.tistory.com/29?category=987369)