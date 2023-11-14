//

//

//

import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  String email;
  String password;
  String name;
  String phoneNumber;
  String uid;

  UserData({
    required this.email,
    required this.password,
    required this.name,
    required this.phoneNumber,
    required this.uid,
  });

// To convert the UserData(Data type) to   Map<String, Object>
  Map<String, dynamic> convert2Map() {
    return {
      "Email": email,
      "Password": password,
      "Name": name,
      "NumberOfUser": phoneNumber,
      "Type": "محاسب",
      "State": false,
      "Maneg": false,
      "DelarsChanges": false,
      "AddFarms": false,
      "ManegEmployee": false,
      "uid": uid,
      "Bills": [],
      "Cach": 0.0,
    };
  }
  // function that convert "DocumentSnapshot" to a User
// function that takes "DocumentSnapshot" and return a User

  static convertSnap2Model(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserData(
      email: snapshot["email"],
      password: snapshot["Password"],
      name: snapshot["Name"],
      phoneNumber: snapshot["NumberOfUser"],
      uid: snapshot["uid"],
    );
  }
}
