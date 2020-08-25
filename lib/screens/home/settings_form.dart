import 'package:firebase/shared/constants.dart';
import 'package:flutter/material.dart';

class FormSettings extends StatefulWidget {
  @override
  _FormSettingsState createState() => _FormSettingsState();
}

class _FormSettingsState extends State<FormSettings> {

  final _formKey = GlobalKey<FormState> ();
  final List<String> sugars = ['0', '1','2','3','4'];

  //from values
  String _currentName;
  String _currentSugars;
  String _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
      //properties
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Update your brew settings', style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20,),
          TextFormField(
            decoration: textInputDecoration,
            validator: (val) => val.isEmpty ? 'Please enter a name' : null,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          SizedBox(height: 20,),
          DropdownButtonFormField(
            decoration: textInputDecoration,
            value: _currentSugars ?? '0',
            items: sugars.map((sugar) {
              return DropdownMenuItem(
                value: sugar,
                child: Text('$sugar sugars')
                );
            }).toList(), 
            onChanged: (val) => setState(() => _currentSugars = val)
          ),
          SizedBox(height: 20,),
          RaisedButton(
            onPressed: () async { // because in future it will be communicating to Firebase
              print(_currentName);
              print(_currentSugars);
              print(_currentStrength);
            },
            color: Colors.blue,
            child: Text('Update', style: TextStyle(color: Colors.white),
            
            ),
          ),
          
         
        ],
      ),
    );
  }
}