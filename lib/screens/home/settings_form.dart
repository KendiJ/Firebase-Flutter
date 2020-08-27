import 'package:firebase/models/user.dart';
import 'package:firebase/services/database.dart';
import 'package:firebase/shared/constants.dart';
import 'package:firebase/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  int _currentStrength;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData) {

          UserData userData = snapshot.data;
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
                initialValue: userData.name,
                decoration: textInputDecoration,
                validator: (val) => val.isEmpty ? 'Please enter a name' : null,
                onChanged: (val) => setState(() => _currentName = val),
              ),
              SizedBox(height: 20,),
              DropdownButtonFormField(
                decoration: textInputDecoration,
                value: _currentSugars ?? userData.sugars,
                items: sugars.map((sugar) {
                  return DropdownMenuItem(
                    value: sugar,
                    child: Text('$sugar sugars')
                    );
                }).toList(), 
                onChanged: (val) => setState(() => _currentSugars = val)
              ),
              SizedBox(height: 20,),
              
              Slider(
                value: (_currentStrength ?? 100).toDouble(), 
                min: 100,
                max: 900,
                divisions: 8,
                activeColor: Colors.brown[_currentStrength ?? userData.strength],
                inactiveColor: Colors.brown[_currentStrength ?? userData.strength],
                onChanged: (val) => setState(() => _currentStrength = val.round()),
              ),


              SizedBox(height: 20,),
              RaisedButton(
                onPressed: () async { // because in future it will be communicating to Firebase
                  if(_formKey.currentState.validate()) {
                    await DatabaseService(uid: user.uid).updateUserData(
                      _currentSugars ?? userData.sugars,
                      _currentName ?? userData.name,
                      _currentStrength ?? userData.strength
                    );
                    Navigator.pop(context);
                  }
                },
                color: Colors.blue,
                child: Text('Update', style: TextStyle(color: Colors.white),
                
                ),
              ),
              
             
            ],
          ),
        );
        } else {
          return Loading();
        }
        
      }
    );
  }
}