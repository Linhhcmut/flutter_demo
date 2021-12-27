import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taxi_application/src/view/dialog/loading_dialog.dart';
import 'package:taxi_application/src/view/dialog/msg_dialog.dart';
import 'package:taxi_application/src/view/home_page.dart';
import 'package:taxi_application/src/view_modle/register_viewmodle.dart';
import 'login_page.dart';
import 'package:firebase_core/firebase_core.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final registerViewModle = RegisterViewModle();

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("complete");
      setState(() {});
    });
    nameController.addListener(() {
      registerViewModle.nameSink.add(nameController.text);
    });
    phoneController.addListener(() {
      registerViewModle.phoneSink.add(phoneController.text);
    });
    emailController.addListener(() {
      registerViewModle.emailSink.add(emailController.text);
    });
    passController.addListener(() {
      registerViewModle.passSink.add(passController.text);
    });
  }

  @override
  void dispose() {
    super.dispose();
    registerViewModle.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xff3277D8)),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Image.asset('signup_car.png'),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 10),
                child: Text(
                  "Welcome Aboard!",
                  style: TextStyle(color: Color(0xff333333), fontSize: 27),
                ),
              ),
              Text(
                "Signup with iCab in simple steps",
                style: TextStyle(color: Color(0xff606470), fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 70, 0, 10),
                child: StreamBuilder<String>(
                    stream: registerViewModle.nameStream,
                    builder: (context, snapshot) {
                      return TextFormField(
                        controller: nameController,
                        style: TextStyle(color: Colors.black, fontSize: 17),
                        decoration: InputDecoration(
                            labelText: "Name",
                            errorText: snapshot.data,
                            prefixIcon: Icon(Icons.account_box),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffCED9D2), width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                            )),
                      );
                    }),
              ),
              StreamBuilder<String>(
                  stream: registerViewModle.phoneStream,
                  builder: (context, snapshot) {
                    return TextFormField(
                      controller: phoneController,
                      style: TextStyle(color: Colors.black, fontSize: 17),
                      decoration: InputDecoration(
                          labelText: "Phone Number",
                          errorText: snapshot.data,
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          )),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: StreamBuilder<String>(
                    stream: registerViewModle.emailStream,
                    builder: (context, snapshot) {
                      return TextFormField(
                        controller: emailController,
                        style: TextStyle(color: Colors.black, fontSize: 17),
                        decoration: InputDecoration(
                            labelText: "Email",
                            errorText: snapshot.data,
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                            )),
                      );
                    }),
              ),
              StreamBuilder<String>(
                  stream: registerViewModle.passStream,
                  builder: (context, snapshot) {
                    return TextFormField(
                      controller: passController,
                      obscureText: true,
                      style: TextStyle(color: Colors.black, fontSize: 17),
                      decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock),
                          errorText: snapshot.data,
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          )),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: StreamBuilder<bool>(
                      stream: registerViewModle.btnStream,
                      builder: (context, snapshot) {
                        return RaisedButton(
                          onPressed:
                              snapshot.data == true ? _onSignUpClicked : null,
                          color: Color(0xff3277D8),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6))),
                          child: Text(
                            "Signup",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        );
                      }),
                ),
              ),
              RichText(
                  text: TextSpan(
                      text: "Already a User ?",
                      style: TextStyle(color: Color(0xff606478), fontSize: 17),
                      children: <TextSpan>[
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                      text: " Login now",
                      style: TextStyle(color: Color(0xff3277D8)),
                    )
                  ]))
            ],
          ),
        ),
      ),
    );
  }

  _onSignUpClicked() {
    LoadingDialog.showLoadingDialog(context, "Loading...");
    registerViewModle.signUp(emailController.text, passController.text,
        phoneController.text, nameController.text, () {
      LoadingDialog.hideLoadingDialog(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }, (msg) {
      LoadingDialog.hideLoadingDialog(context);
      MsgDialog.showMsgDialog(context, "Sign-In", msg);
    });
  }
}
