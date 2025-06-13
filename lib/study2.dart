// 1단계: 가장 최상위 부모 클래스
class GrandGrandParent {
  final String ultimateValue;

  GrandGrandParent({required this.ultimateValue}) {
    print('1. GrandGrandParent 생성자 바디 실행: ultimateValue="$ultimateValue"');
  }
}

// 2단계: GrandGrandParent를 상속받음
class GrandParent extends GrandGrandParent {
  final String grandValue;

  // super.ultimateValue를 통해 GrandGrandParent의 생성자 매개변수에 값을 전달
  GrandParent({required super.ultimateValue, required this.grandValue}) {
    print('2. GrandParent 생성자 바디 실행: grandValue="$grandValue"');
  }
}

// 3단계: GrandParent를 상속받음
class Parent extends GrandParent {
  final String parentValue;

  // super.ultimateValue와 super.grandValue를 통해 GrandParent의 생성자 매개변수에 값을 전달
  Parent({
    required super.ultimateValue,
    required super.grandValue,
    required this.parentValue,
  }) {
    print('3. Parent 생성자 바디 실행: parentValue="$parentValue"');
  }
}

// 4단계: Parent를 상속받음 (가장 하위 클래스)
class Child extends Parent {
  final String childValue;

  // super.ultimateValue, super.grandValue, super.parentValue를 통해
  // Parent의 생성자 매개변수에 값을 전달합니다.
  // 이 값들은 다시 Parent를 통해 GrandParent로, 그리고 GrandGrandParent로 전달됩니다.
  Child({
    required super.ultimateValue,
    required super.grandValue,
    required super.parentValue,
    required this.childValue,
  }) {
    print('4. Child 생성자 바디 실행: childValue="$childValue"');
  }
}

void main() {
  print('--- 인스턴스 생성 시작 ---');
  var finalChild = Child(
    ultimateValue: 'Ultimate!',
    grandValue: 'Grand!',
    parentValue: 'Parent!',
    childValue: 'Child!',
  );
  print('--- 인스턴스 생성 완료 ---');

  print('\n--- 최종 필드 값 확인 ---');
  print('GrandGrandParent.ultimateValue: ${finalChild.ultimateValue}');
  print('GrandParent.grandValue: ${finalChild.grandValue}');
  print('Parent.parentValue: ${finalChild.parentValue}');
  print('Child.childValue: ${finalChild.childValue}');
}
