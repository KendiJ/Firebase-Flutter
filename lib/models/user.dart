class User {

  final String uid;

  User({this.uid});
}

// new user data object (You can extend one model indipendent of the other)
class UserData {
  final String uid;
  final String name;
  final String sugars;
  final String strength;

  UserData({this.name, this.uid, this.sugars, this.strength});
}