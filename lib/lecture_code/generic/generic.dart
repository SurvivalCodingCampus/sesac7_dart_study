void main(){

  Pocket<int> porket = Pocket();
  // final porket = Pocket<int>();
  porket.item = 1;

}

class Pocket<E> {

  E? item;

}
