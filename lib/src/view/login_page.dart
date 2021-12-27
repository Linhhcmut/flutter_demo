import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taxi_application/src/view/dialog/loading_dialog.dart';
import 'package:taxi_application/src/view/dialog/msg_dialog.dart';
import 'package:taxi_application/src/view/home_page.dart';
import 'package:taxi_application/src/view/register_page.dart';
import 'package:taxi_application/src/view_modle/login_viewmodle.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final loginViewModle = LoginViewModle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 150,
              ),
              Image.asset('login_car.png'),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                child: Text("Welcome Back!",
                    style: TextStyle(fontSize: 27, color: Color(0xff333333))),
              ),
              Text(
                "Login to continue using iCab",
                style: TextStyle(fontSize: 20, color: Color(0xff606470)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 15),
                child: TextFormField(
                  controller: _emailController,
                  style: TextStyle(fontSize: 17, color: Colors.black),
                  decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffCED9D2), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      )),
                ),
              ),
              TextFormField(
                controller: _passController,
                obscureText: true,
                style: TextStyle(color: Colors.black, fontSize: 17),
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffCED9D2), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                ),
              ),
              Container(
                alignment: AlignmentDirectional.centerEnd,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(color: Color(0xff606470), fontSize: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    onPressed: _onLoginClick,
                    color: Color(0xff3277D8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    child: Text(
                      "Log In",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              RichText(
                  text: TextSpan(
                      text: "New User?",
                      style: TextStyle(color: Color(0xff606478), fontSize: 17),
                      children: <TextSpan>[
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()));
                        },
                      text: " Sign up for a new account",
                      style: TextStyle(color: Color(0xff3277D8), fontSize: 17),
                    )
                  ])),
            ],
          ),
        ),
      ),
    );
  }

  void _onLoginClick() {
    LoadingDialog.showLoadingDialog(context, "Loading...");
    loginViewModle.signIn(_emailController.text, _passController.text, () {
      LoadingDialog.hideLoadingDialog(context);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomePage()));
    }, (msg) {
      LoadingDialog.hideLoadingDialog(context);
      MsgDialog.showMsgDialog(context, "Sign in", msg);
    });
  }
}
