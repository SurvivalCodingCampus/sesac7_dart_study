class Grandparent {
  final String gpName;

  // Grandparent의 초기화 리스트 (this.gpName)
  Grandparent(this.gpName) {
    print('2. Grandparent 생성자 바디 실행: gpName="$gpName"');
  }
}

class Parent extends Grandparent {
  final int parentId;
  final String processedParentName;

  // Parent의 초기화 리스트: processedParentName을 가공하고, super() 호출
  Parent({required String name, required this.parentId})
    : processedParentName = '가공된 부모 이름: $name', // Parent 필드 초기화
      super(name) {
    // super()를 통해 Grandparent의 생성자를 호출 (name 전달)
    print(
      '4. Parent 생성자 바디 실행: parentId=$parentId, processedParentName="$processedParentName"',
    );
  }
}

class Child extends Parent {
  final String childRole;

  // Child 생성자:
  // super.name과 super.parentId는 Parent의 생성자 매개변수에 직접 연결됩니다.
  // this.childRole은 Child의 초기화 리스트에서 초기화됩니다.
  Child({
    required super.name, // Parent의 name 매개변수로 값을 전달
    required super.parentId, // Parent의 parentId 매개변수로 값을 전달
    required this.childRole, // Child의 childRole 초기화
  }) {
    print('6. Child 생성자 바디 실행: childRole="$childRole"');
  }
}

class SuperClass {
  final String name; // SuperClass의 필드 (인스턴스 변수)
  final int age; // SuperClass의 필드 (인스턴스 변수)

  // 생성자 매개변수 'this.name'은 SuperClass의 'name' 필드를 초기화합니다.
  // 생성자 매개변수 'this.age'는 SuperClass의 'age' 필드를 초기화합니다.
  SuperClass({required this.name, required this.age}) {
    print('SuperClass 생성자 바디 실행: name=$name, age=$age');
  }
}

class SubClass extends SuperClass {
  String hobby;

  // SubClass의 생성자.
  // super.name과 super.age는 SubClass의 매개변수를 선언하면서,
  // 동시에 이 값들을 SuperClass의 생성자 매개변수 'name'과 'age'로 전달합니다.
  // SuperClass 생성자의 'name'과 'age'는 다시 'this.name', 'this.age'로
  // SuperClass의 필드들을 초기화합니다.
  SubClass({required super.name, required super.age, required this.hobby}) {
    print('SubClass 생성자 바디 실행: hobby=$hobby');
  }
}

void main() {
  var sub = SubClass(name: '홍길동', age: 30, hobby: '코딩');

  print('\n최종 필드 값:');
  print('이름: ${sub.name}'); // SuperClass의 필드 'name'
  print('나이: ${sub.age}'); // SuperClass의 필드 'age'
  print('취미: ${sub.hobby}'); // SubClass의 필드 'hobby'

  print('--- 인스턴스 생성 시작 ---');
  var child = Child(name: '아이', parentId: 101, childRole: '학생');
  print('--- 인스턴스 생성 완료 ---');

  print('\n--- 최종 필드 값 ---');
  print('Grandparent gpName: ${child.gpName}'); // 예상: 아이
  print('Parent parentId: ${child.parentId}'); // 예상: 101
  print(
    'Parent processedParentName: ${child.processedParentName}',
  ); // 예상: 가공된 부모 이름: 아이
  print('Child childRole: ${child.childRole}'); // 예상: 학생
}
