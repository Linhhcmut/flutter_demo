import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:taxi_application/src/fire_base/fire_base_auth.dart';
import 'package:taxi_application/src/validations/register_vali.dart';

class RegisterViewModle {
  var _firAuth = FireAuth();

  final _nameController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _phoneController = BehaviorSubject<String>();
  final _passController = BehaviorSubject<String>();
  final _btnSignUp = BehaviorSubject<bool>();

  var nameValidation =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    sink.add(Register_Validation.validateName(name));
  });
  var emailValidation =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    sink.add(Register_Validation.validateEmail(email));
  });
  var phoneValidation =
      StreamTransformer<String, String>.fromHandlers(handleData: (phone, sink) {
    sink.add(Register_Validation.validatePhone(phone));
  });
  var passController =
      StreamTransformer<String, String>.fromHandlers(handleData: (pass, sink) {
    sink.add(Register_Validation.validatePass(pass));
  });
  Stream<String> get nameStream =>
      _nameController.stream.transform(nameValidation);
  Sink<String> get nameSink => _nameController.sink;

  Stream<String> get emailStream =>
      _emailController.stream.transform(emailValidation);
  Sink<String> get emailSink => _emailController.sink;

  Stream<String> get phoneStream =>
      _phoneController.stream.transform(phoneValidation);
  Sink<String> get phoneSink => _phoneController.sink;

  Stream<String> get passStream =>
      _passController.stream.transform(passController);
  Sink<String> get passSink => _passController.sink;

  Stream<bool> get btnStream => _btnSignUp.stream;
  Sink<bool> get btnSink => _btnSignUp.sink;

  RegisterViewModle() {
    CombineLatestStream.combine4(
        _nameController, _emailController, _phoneController, _passController,
        (name, email, phone, pass) {
      return Register_Validation.validateName(name) == null &&
          Register_Validation.validateEmail(email) == null &&
          Register_Validation.validatePhone(phone) == null &&
          Register_Validation.validatePass(pass) == null;
    }).listen((register) {
      btnSink.add(register);
    });
  }

  void signUp(String email, String pass, String phone, String name,
      Function onSuccess, Function(String) onRegisterError) {
    _firAuth.signUp(email, pass, phone, name, onSuccess, onRegisterError);
  }

  dispose() {
    _nameController.close();
    _emailController.close();
    _phoneController.close();
    _passController.close();
    _btnSignUp.close();
  }
}
