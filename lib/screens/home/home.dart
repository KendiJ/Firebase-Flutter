import 'package:firebase/models/brew.dart';
import 'package:firebase/screens/home/brew_list.dart';
import 'package:firebase/screens/home/settings_form.dart';
import 'package:firebase/services/auth.dart';
import 'package:firebase/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {

  //create an instance of the _auth Service for signout.
  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {

    // create a function that will invoke the built in function inside the flutter library
    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical:20, horizontal: 60),
          child: FormSettings(),
        );
      });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
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
              label: Text('Log out')
            ),
            FlatButton.icon(
              onPressed: () => _showSettingsPanel(), 
              icon: Icon(Icons.settings), 
              label: Text('Settings'))
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}