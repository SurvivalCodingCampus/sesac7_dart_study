import 'dart:math';

void main() {
  final List<int> items = [1, 2, 3, 4, 42];

  print(items);
  Iterable<int> filteredItems = items.where((e) => e.isEven);
  List<int> filteredList = filteredItems.toList();

  print(items.reduce((v, e) {
    return max(v, e);
  }));
  print(items.reduce((v, e) => max(v, e)));
  print(items.reduce(max));


  print(items.reduce(myFunc));

  print(f(items));
}

int myFunc(int a, int b) {
  return a - b;
}

bool f(List<int> list) {
  for (var i in list) {
    if (i == 42) {
      return true;
    }
  }
  return false;
}

bool aaa(int i) {
  if (i == 42) {
    return true;
  }
  return false;
}
