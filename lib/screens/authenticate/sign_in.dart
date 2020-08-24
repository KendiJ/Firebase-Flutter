import 'package:firebase/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
//Accessing the Anonymous auth function
  final AuthService _authy = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.brown[400],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: RaisedButton(
          onPressed: () async {
            //add dynamic variable to either signin or return null
            dynamic result = await _authy.signinAnonymously();
            if(result == null){
              print("Error signing in");
            } else {
              print("signed in");
              print(result.uid);
            }
          },
          child: Text('Sign In Anonymously'),
        ),
      ),
    );
  }
}