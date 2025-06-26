void main() {
  final numbers = [1, 2, 3];

  something(numbers);
  print(numbers);

  numbers.remove(1);
  print(numbers);
}

void something(List<int> items) {
  items.add(4);
  items.add(4);
  items.add(4);
  print(items[5].isEven);
  items.add(4);
  items.add(4);
}