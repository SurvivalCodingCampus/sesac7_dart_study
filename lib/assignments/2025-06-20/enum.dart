enum AuthState { authenticated, unauthenticated, unknown }

void main() {
  AuthState state = AuthState.authenticated;

  switch (state) {
    case AuthState.authenticated:
      print('인증됨');
    case AuthState.unauthenticated:
      print('인증되지 않음');
    case AuthState.unknown:
      print('모름.');
  }

  ///switch문에서 enum 타입을 쓰면 모든 경우의수를 구현하지않으면 컴파일에러가 난다.
  ///모든 케이스에 대한 구현을 해줘야한다.
  ///
}