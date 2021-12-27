import 'package:taxi_application/src/fire_base/fire_base_auth.dart';

class LoginViewModle {
  
  var _firAuth = FireAuth();

  void signIn(String email, String pass, Function onSuccess,
      Function(String) onSignInError) {
    _firAuth.signIn(email, pass, onSuccess, onSignInError);
  }
}
