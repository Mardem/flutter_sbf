class GoogleSignInUserDetails {
  String? name;
  String? email;
  bool emailVerified;
  bool isAnonymous;

  GoogleSignInUserDetails({
    this.name,
    this.email,
    this.emailVerified = false,
    this.isAnonymous = false,
  });
}
