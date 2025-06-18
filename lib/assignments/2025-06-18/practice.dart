abstract interface class Drawable {
  void draw();
}

class House implements Drawable {
  String address;
  int size;
  String color;

  House({required this.address, required this.size, required this.color});

  @override
  void draw() {
    print('집을 그립니다.');
  }
}

void main() {
  final Drawable drawable = House(
    address: '서울시 강남구',
    size: 100,
    color: 'Black',
  );

  ///Drawable drawable = House() 에서 컴파일타임때는, 컴파일러가 drawable이 Drawable타입이라고 생각한다. 런타임때 House()가 할당되어, 실제로 drawable은 House타입이구나를 알게된다.
  ///그래서 drawable. 을 하고나면 Drawable에 있는 변수나 메소드에는 접근할 수 있지만 실제 House타입의 변수나 메소드를 사용하면 컴파일에러가 발생하게 된다.
  ///그래서 스마트 타입 체크를 통해서, if(drawable is House) 로 타입체크를 통해, drawable.draw()같이 House에 있는 메소드를 오류없이 실행할 수 있게된다.
  ///실제 타입은 런타임시에 결정됨.
  if (drawable is House) {
    print(drawable.address);
  }
  // print(drawable.address);

  final List<Drawable> elements = <Drawable>[
    House(address: '서울시 강서구', size: 1, color: 'White'),
    House(address: '서울시 영등포구', size: 2, color: 'Yellow'),
    House(address: '서울시 중랑구', size: 3, color: 'Green'),
  ];
}
