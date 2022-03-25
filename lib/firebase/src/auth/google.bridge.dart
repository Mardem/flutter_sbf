import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'mapper/google_signin.mapper.dart';

abstract class GoogleAuthBridge {
  Future<GoogleSignInUserDetails?> signIn();

  Future<GoogleSignInAuthentication> authentication();

  OAuthCredential credential({String? idToken, String? accessToken});

  Future<UserCredential> signInWithCredential(AuthCredential credential);

  Future<bool> isSignedIn();

  Future<GoogleSignInAccount?> disconnect();

  Future<GoogleSignInAccount?> signOut();
}

class GoogleAuthBridgeImpl implements GoogleAuthBridge {
  late GoogleSignIn _googleSignIn;

  late GoogleSignInAccount? _signedAccount;

  late FirebaseAuth _firebaseAuth;

  GoogleAuthBridgeImpl() {
    _googleSignIn = GoogleSignIn();
    _firebaseAuth = FirebaseAuth.instance;
  }

  @override
  Future<GoogleSignInUserDetails?> signIn() async {
    GoogleSignInAccount? userSignIn = await _googleSignIn.signIn();

    if (userSignIn != null) {
      GoogleSignInUserDetails user = GoogleSignInUserDetails();

      return user
        ..name = userSignIn.displayName
        ..email = userSignIn.email;
    } else {
      throw Exception('Falha na autenticação do usuário via Google');
    }
  }

  @override
  Future<GoogleSignInAuthentication> authentication() async {
    return _signedAccount!.authentication;
  }

  @override
  OAuthCredential credential({String? idToken, String? accessToken}) {
    return GoogleAuthProvider.credential(
      accessToken: accessToken,
      idToken: idToken,
    );
  }

  @override
  Future<UserCredential> signInWithCredential(AuthCredential credential) async {
    return _firebaseAuth.signInWithCredential(credential);
  }

  @override
  Future<bool> isSignedIn() async {
    return await _googleSignIn.isSignedIn();
  }

  @override
  Future<GoogleSignInAccount?> disconnect() async {
    return await _googleSignIn.disconnect();
  }

  @override
  Future<GoogleSignInAccount?> signOut() async {
    return await _googleSignIn.signOut();
  }
}
