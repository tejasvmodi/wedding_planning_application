class SignUpWithEmailAndPasswordFailure {
  final String message;
  SignUpWithEmailAndPasswordFailure(
      [this.message = "An Unknown Error Occurred"]);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return SignUpWithEmailAndPasswordFailure(
            'Please Enter A Stronger Password');
      case 'invalid-email':
        return SignUpWithEmailAndPasswordFailure(
            'Email is Not valid or badly formated');
      case 'email-already-in-use':
        return SignUpWithEmailAndPasswordFailure(
            'An account already exists for this email');
      case 'operation-not-allowed':
        return SignUpWithEmailAndPasswordFailure(
            'operation not allowed please contact support team');
      case 'user-disabled':
        return SignUpWithEmailAndPasswordFailure(
            'the user has been disabled please contact support for help');
      case 'INVALID_LOGIN_CREDENTIALS':
        return SignUpWithEmailAndPasswordFailure(
            'Email or Password dosen\'t match');
      default:
        return SignUpWithEmailAndPasswordFailure();
    }
  }
}