enum AuthState {
  authenticated,
  unauthenticated,
  unknown,
}

void main() {

  AuthState state = AuthState.authenticated;

  switch(state) {
    case AuthState.authenticated:
      print('인증됨');
    case AuthState.unauthenticated:
      print('인증 안 됨');
    case AuthState.unknown:
      print('몰라');
  }
}
