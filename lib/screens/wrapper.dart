import 'package:firebase/screens/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //returns either home or auth, depending on authentication 
    return Home();
  }
}