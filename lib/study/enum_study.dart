enum AuthState {
  authenticated,
  unauthenticated,
  unknown,
}

void main() {
  AuthState authState = AuthState.authenticated;

  switch (authState) {
    case AuthState.authenticated:
      print('인증됨');
    case AuthState.unauthenticated:
      print('인증안됨');
    case AuthState.unknown:
      print('모름');
  }
}
