import 'package:flutter_sbf/firebase/src/auth/mapper/google_signin.mapper.dart';

class GoogleBridgeValidUser {
  static const String name = 'Pedro Silva';
  static const String email = 'pedro@pedepronto.com.br';
  static const bool emailVerified = true;
  static const bool isAnonymous = false;
}

class GoogleBridgeValid {
  static GoogleSignInUserDetails userDetails() {
    GoogleSignInUserDetails user = GoogleSignInUserDetails();

    return user
      ..name = GoogleBridgeValidUser.name
      ..email = GoogleBridgeValidUser.email
      ..emailVerified = GoogleBridgeValidUser.emailVerified
      ..isAnonymous = GoogleBridgeValidUser.isAnonymous;
  }
}

class GoogleBridgeException {
  static GoogleSignInUserDetails userDetails() {
    throw Exception('Falha na autenticação do usuário via Google');
  }
}
