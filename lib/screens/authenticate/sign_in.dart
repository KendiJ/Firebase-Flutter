import 'package:firebase/services/auth.dart';
import 'package:firebase/shared/constants.dart';
import 'package:firebase/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  // add the constructor for the widget
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
//Accessing the Anonymous auth function
  final AuthService _authy = AuthService();
  final _formKey = GlobalKey<FormState>();

  // set the state for text fields
  String email = "";
  String password = "";
  String error = "";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text("Signin to Firebase"),
        actions: [
          FlatButton.icon(
            onPressed: () {
              widget.toggleView();
            }, 
            icon: Icon(Icons.person), 
            label: Text("Register"))
        ],
        elevation: 0.0,
        backgroundColor: Colors.brown[400],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Enter Email'),
                validator: (val) => val.isEmpty ? 'Enter email adress' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Enter Password'),
                validator: (val) => val.length <6 ? 'Enter more than 6 characters' : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    setState(() => loading = true);
                    dynamic result = await _authy.signInWithEmailAndPassword(email, password);
                    if(result == null) {
                      setState(() {
                        error = 'Invalid credentials';
                        loading = false;
                      });
                    } // this automatically logs you to home page
                  }
                },
                color: Colors.blue,
                child: Text('Sign in', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
              ),
              SizedBox(height: 12),
              Text(
                error,
                style: TextStyle(fontSize: 14, color: Colors.red),
              )
            ],
          )
        )
      ),
    );
  }
}