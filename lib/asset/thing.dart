abstract interface class Thing {
  // getter, setter가 메소드를 통해 필드에 접근할 수 있도록 도와주고,
  // 프로퍼티의 경우에도 getter, setter의 기능을 캡슐화하여 제공하기 때문에,
  // 본 인터페이스를 구현하는 클래스에서 getter, setter 프로퍼티의 기능을 사용자에게 구현(오버라이드)하게 하는 의도라고 가정하면,
  // 아래처럼 작성해도 괜찮지 않을까?

  // getter
  double get weight;

  // setter
  set weight(double weight);
}
