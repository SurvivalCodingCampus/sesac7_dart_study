# 테스트

## 테스트 코드 작성시
1. 경계값 큰 값, 경계값 작은 값, 경계안의 값, 경계밖의 큰 값, 경계밖의 작은 값을 넣어 테스트 한다.

2. print
- print는 값이라는 것을 리턴하지 않는다.
- class 안에 사용하지 않는다: 실제 서비스에 출력되어 방해될 수 있기 때문에
- print 만 담당하는 class 를 만들고 관리한다.

3. Q? : expect(() => Person(inputName: '', inputAge: 20), throwsA(isA<ArgumentError>()));

4. 테스트에서도 반복되는것 메소드로 작성하고 재활용 하는 방법


