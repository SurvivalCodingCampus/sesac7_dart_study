abstract interface class Thing {
  // getter, setter가 메소드를 통해 필드에 접근할 수 있도록 도와주고,
  // 프로퍼티의 경우에도 결국 getter, setter의 기능을 캡슐화 한 것이기 때문에,
  // 따라서 필드가 존재하지 않아야 하는 인터페이스 내부에 있어도 괜찮은 것.
  
  // getter
  double get weight;

  // setter
  set weight(double weight);
}
