import 'package:modu_3_dart_study/assignments/2025-06-13/computer.dart';
import 'package:modu_3_dart_study/assignments/2025-06-13/tangible_asset.dart';
import 'package:modu_3_dart_study/assignments/2025-06-13/thing.dart';

class Book extends TangibleAsset {
  String isbn;

  Book(
    super.weight, {
    required super.name,
    required super.price,
    required super.color,
    required this.isbn,
  });
}

void main() {
  Thing computer = Computer(
    1,
    name: 'name',
    price: 1,
    color: 'color',
    makerName: 'makerName',
  );
  Thing book = Book(1, name: 'name', price: 1, color: 'color', isbn: 'isbn');

  //is-a 관계라면 선언을 Thing,TangibleAsset,Asset타입으로 만들 수 있다.
  // Computer 와 Book은 Thing,TangibleAsset,Asset이기 때문에, 해당 타입으로 만들 수 있다.
  List<Thing> assets = [
    computer,
    book,
  ];

  for (final asset in assets) {
    //이때 asset의 타입을 컴파일시에는 Thing으로 알고있다. Book인지 Computer인지는 런타임때 알수 있기때문에,
    //asset이 Book인지를 if문을 통해 확실히 타입 체크를 한다면 book객체의 변수에 접근할 수 있지만,
    //타입 체크를 하지 않는다면, 모른다. 컴파일시에는 Thing타입으로. 왜? Computer,Book을 모두 Thing타입으로 만들어서.
    if (asset is Book) {
      //스마트 타입 캐스팅 Book.
      print(asset.isbn);
    }
    if (asset is Computer) {
      print(asset.makerName);
    }

    // final book = asset as Book;
    //이렇게 타입 강제 캐스팅 가능한데, 이건 쓰지마라. 날 믿어라 == 휴먼 == 버그.  언제 터질지 모른다.
    //이게 왜 위험하냐면? 나 이거 book인거 알아. 그런데 갑자기 Hero로 바뀌면, book.hp가 가능해진다., 휴먼에러발생.
  }
}

//is-a 관계가 아닌 애들은 만들 수 없다.
//인터페이스도 타입으로 쓸 수 있다.
//컴파일러가 보기에는 character.fireball();
