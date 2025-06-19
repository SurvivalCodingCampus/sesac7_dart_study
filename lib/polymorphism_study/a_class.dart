import 'package:modu_3_dart_study/polymorphism_study/y_abstract_class.dart';

import 'b_class.dart';

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

void main() {
  Y aClass = A();
  Y bClass = B();
  List<Y> classes = [aClass, bClass];

  for(Y element in classes) {
    element.b();
  }
}
