import 'package:flutter/material.dart';
import 'package:test10/firebases/auth.dart';
import 'package:test10/models/user.dart';

//

//

//

//

//

//

class UserProvider with ChangeNotifier {
  UserData? _userData;
  UserData? get getUser => _userData;

  refreshUser() async {
    UserData userData = await AuthMethod().getUserDetails();
    _userData = userData;
    notifyListeners();
  }
}
