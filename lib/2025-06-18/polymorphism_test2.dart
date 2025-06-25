abstract interface class X {
  void a();
}

abstract class Y implements X {
  void b();
}

class A extends Y {
  @override
  void a() {
    print('Aa');
  }

  @override
  void b() {
    print('Ab');
  }

  void c() {
    print('Ac');
  }
}

class B extends Y {
  @override
  void a() {
    print('Ba');
  }

  @override
  void b() {
    print('Bb');
  }

  void c() {
    print('Bc');
  }
}

// 문제 1. obj.a(), obj.b(), obj.c() 중 어떤 걸 호출할 수 있는가?
X obj = A();  
// obj.a() 만 가능함

// 문제2. y1.a(); y2.a(); 를 실행하면 화면에 뭐가 출력되는가?
Y y1 = A();  
Y y2 = B();

// Aa, Ba 출력

// 문제 2 에서 이용한 A클래스나 B클래스의 인스턴스를 각각 1개씩 생성하여, List 에 차례로 담는다.
// 그 후에 List 의 요소를 차례대로 꺼내 각각의 인스턴스의 b() 메소드를 호출 하여야 한다. 이상을 전제로 다음 물음에 답하시오.
// List 변수의 타입으로 무엇을 사용하여야 하는가

void main(){
  List<Y> list = [A(), B()];

  // 리스트에서 하나씩 꺼내 b() 호출하려면 Y 타입이여야함
  for (Y element in list) {
    element.b(); // 다형성 적용 → Ab, Bb 출력
  }
}

 
