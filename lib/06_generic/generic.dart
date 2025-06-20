import '../hero.dart';

void main() {
  final pocket = Pocket<Hero>();

}

class Book {

}

class Dictionary extends Book {

}

class Pocket<E extends Comparable> {
  E? item;
}