## Repository 패턴
---
### 데이터 저장소에 접근하는 객체를 추상화하고 데이터 소스와의 통신을 담당하는 객체를 캡슐화하는 디자인 패턴을 말한다.
- Repository의 책임과 역할
	- 데이터 접근의 진입점
	- 데이터 접근에 대한 추상화 계층
	- 데이터 소스 은닉
	- 비즈니스 로직과 데이터 소스 사이의 중재자
	- 데이터 매핑, 변환을 담당
- Repository 패턴의 이점
	- **데이터 접근 추상화**
		- 데이터 소스 구현 세부사항 은닉
		- 일관된 인터페이스 제공
	- **유지보수성 향상**
		- 관심사 분리
		- 코드 재사용성
	- **테스트 용이성**
		- 데이터 소스 Moking 가능
		- 단위 테스트 작성 용이
	- **확장성**
		- 새로운 데이터 소스 추가 용이
		- 기존 코드 수정 최소화
		- 인터페이스 기반 설계
- Repository는 DataSource 사용 및 관리, 필요한 데이터 전달에 집중해야한다.
- 주의할 점
	- 직접적인 데이터 조작이 아닌 데이터를 골라내는 일을 해야한다.
	- 복잡한 비즈니스 로직은 더 상위 계층에서 하고 Repository에서 하지 않는다.
	```dart
	abstract interface class PersonRepository {
		Future<List<Person>> findByAgePersonList(int age);
	}

	class PersonRepositoryImpl implements PersonRepository {
		PersonDataStore _personDataStoreImpl;
		PersonRepositoryImpl({required PersonDataStore personDataStoreImpl})
			: _personDataStoreImpl = personDataStoreImpl;
			
		@override
		Future<List<Person>> findByAgePersonList(int age) async {
			final people = _personDataStoreImpl.getPeople();
			return people.where((person) => person.age == age).toList();
		}
	}
	```