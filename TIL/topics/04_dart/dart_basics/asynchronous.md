# 비동기

- 콜백 함수

###  Future<String> 비동기 처리때 사용하는 함수 명시, Future 타입 반환하는 것
```dart
- Future<String> fetchData() { // 오래걸리고 비동기 처리를 하는 함수라는 명시
// 실행전 함수가 담겨있음
    return Future.delayed(Duration(seconds: 1), () => '데이터');
    // Futrue 생성자
 }
```
- fetchData() 는 Future 타입이라서 실행 예정인 것


### async / await 사용
- async 가 붙어있는 비동기 함수여야지 순차적으로 만들수 있다, 암묵적으로 Future 타입이라고 본다
- await 끝나기를 기다렸다가
- return 한다
- Future 함수 등장할 때 마다 await 사용
- 성능은 콜백 함수보다 조금 떨어지지만
- 디버깅 하기 좋고 인간이 이해하기 좋으면서 

### 에러는 try/catch 사용