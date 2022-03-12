// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/background.png')),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 400,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Sign In to Continue"),
                    Text("Retro",
                        style: TextStyle(
                            fontSize: 60,
                            color: Colors.white,
                            shadows: [
                              BoxShadow(
                                  blurRadius: 5,
                                  color: Colors.green.shade900,
                                  offset: Offset(3, 3))
                            ])),
                    // with custom text
                    Column(
                      children: [
                        SignInButton(
                          Buttons.Google,
                          text: "Sign in with Google",
                          onPressed: () {},
                        ),
                        SignInButton(
                          Buttons.Facebook,
                          text: "Sign in with Facebook",
                          onPressed: () {},
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        Text(
                          "By Signing-In you are agreeing to our",
                          style: TextStyle(
                            color: Colors.grey[800],
                          ),
                        ),
                        Text(
                          "Terms and Privacy Policy",
                          style: TextStyle(
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
