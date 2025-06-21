void main() {
  // Pocket pocket = Pocket();
  // pocket.item ///이렇게 하면 item이 dynamic타입이 되어버린다.
  // ///
  // final pocket2 = Pocket<int>();
  // pocket2.item

  final pocket = Pocket<a>();
}

abstract interface class AA {}

///E는 Element. 요소의 약자.
///
class Pocket<E extends Book> {
  E? item;
}

class Book {}

class Dictionary extends Book {}

class a extends Dictionary {}
