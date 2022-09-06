import 'dart:io';

enum AuthMode { isLogin, isSignUp }

class AuthFormData {
  String name = '';
  String email = '';
  String password = '';
  File? image;

  AuthMode _mode = AuthMode.isSignUp;

  bool get isLogin {
    return _mode == AuthMode.isLogin;
  }

  bool get isSignUp {
    return _mode == AuthMode.isSignUp;
  }

  void toggleAuthMode() {
    _mode = isLogin ? AuthMode.isSignUp : AuthMode.isLogin;
  }
}
