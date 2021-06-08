import 'package:flutter/material.dart';
import './widget/text_field.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  void validation() {
    // ignore: unnecessary_null_comparison
    if (firstname.text.trim().isEmpty || firstname.text.trim() == null) {
      globalKey.currentState!.showSnackBar(
        SnackBar(
          content: Text('firstname is empty'),
        ),
      );
    }
    return;
  }

  Widget button(
      {required String buttonText,
      required Color buttonColor,
      required Color buttonTextColor}) {
    return Container(
      width: 120,
      child: RaisedButton(
        color: buttonColor,
        onPressed: validation,
        child: Text(
          buttonText,
          style: TextStyle(color: buttonTextColor, fontSize: 15),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              Container(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyFieldText(
                      hintText: 'First Name',
                      obscureText: false,
                      controller: firstname,
                    ),
                    MyFieldText(
                      hintText: 'Last Name',
                      obscureText: false,
                      controller: lastname,
                    ),
                    MyFieldText(
                      hintText: 'Email',
                      obscureText: false,
                      controller: email,
                    ),
                    MyFieldText(
                        hintText: 'Password',
                        obscureText: true,
                        controller: password),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  button(
                    buttonText: 'Cancel',
                    buttonColor: Colors.grey,
                    buttonTextColor: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  button(
                    buttonText: 'Sign Up',
                    buttonColor: Colors.red,
                    buttonTextColor: Colors.white,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
