// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Future<User?> _googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;
      // print("signed in " + user.displayName);

      return user;
    } catch (e) {
      print(e);
    }
  }

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
              SizedBox(
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
                          onPressed: () {
                            _googleSignUp().then(
                              (value) => Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => Scaffold(
                                    body: Text("Hello"),
                                  ),
                                ),
                              ),
                            );
                          },
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
