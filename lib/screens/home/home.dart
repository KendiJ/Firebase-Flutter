import 'package:firebase/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  //create an instance of the _auth Service for signout.
  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Firebase'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: [
          FlatButton.icon(
            onPressed: () async {
              await _auth.signOut();
            }, 
            icon: Icon(Icons.person), 
            label: Text('Log out'))
        ],
      ),
    );
  }
}