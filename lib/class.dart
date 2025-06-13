import 'hero.dart';

class Exam {
  int a = 1;
  int b = 2;
  int c;

  Exam(this.c) {
    c += 2;
    a = 5;
    b = 3;
    plus();
  }

  void plus() {
    a++;
  }
}

void main() {
  Exam exam = Exam(7);
  print(exam.a);
  print(exam.b);
  print(exam.c);
  // final hero1 = Hero('이학민', 50);
  // final hero2 = hero1;
  // hero2.hp = 100;
  // print(hero2.hp);
}
