class Person{
  String _storeName = ''; // private 필드
  
  // 생성자에서 setter 를 안거치고 직접 저장
  // Person({required String inputName, required int inputAge}) : _storeName = inputName, _storeAge = inputAge;

  // 세터를 통해서 인스턴스를 초기화
  Person({required String inputName}){
    nameSetter = inputName;
  }

  set nameSetter(String newName) {
    if (newName.length < 1) {
      throw Exception('이름이 너무 짧습니다');
    }

    if (newName.length > 8) {
      throw Exception('이름이 너무 깁니다');
    }

    _storeName = newName;
  }

}

void main(){
  final person = Person(inputName: '홍길동');
  print(person);
}

