import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireAuth {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void signUp(String email, String pass, String phone, String name,
      Function onSuccess, Function(String) onRegisterError) {
    try {
      _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: pass)
          .then((user) {
        //
        _createUser(phone, name, onSuccess, onRegisterError);
      }).catchError((err) {
        _registerError(err.code, onRegisterError);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void signIn(String email, String pass, Function onSuccess,
      Function(String) onSignInError) {
    _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((user) {
      print("on sign in success");
      onSuccess();
    }).catchError((erro) {
      onSignInError("Sign in fail, please try again");
    });
  }
}

_createUser(String phone, String name, Function onSuccess,
    Function(String) onRegisterError) {
  var users = FirebaseFirestore.instance.collection("Users");
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  var user = {"phone": phone, "name": name, "uid": uid};
  users.add(user).then((user) {
    //success
    onSuccess();
  }).catchError((err) {
    onRegisterError("Signup fail, please try again");
  });
}

void _registerError(String code, Function(String) onRegisterError) {
  switch (code) {
    case 'email-already-in-use':
      onRegisterError("Email has existed");
      break;
    case 'wrong-password':
      onRegisterError("Email has existed");
      break;
    case 'invalid-email':
      onRegisterError("Email has existed");
      break;
  }
}
