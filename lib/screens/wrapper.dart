import 'package:firebase/models/user.dart';
import 'package:firebase/screens/authenticate/authenticate.dart';
import 'package:firebase/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // Accessing user data from Provider Data 
    final user  = Provider.of<User>(context);
    

    //returns either home or auth, depending on authentication 
    
    if(user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}