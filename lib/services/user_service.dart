import 'package:flutter/material.dart';
import 'package:flutter_singleton/models/user.dart';

class UserService with ChangeNotifier {
  // Property is private so notifyListeners can be called during set
  User? _user;

  User? get user => _user;
  bool get userExists => _user != null ? true : false;

  set user(User? newUser) {
    _user = newUser;
    notifyListeners();
  }

  void changeAge(int age) {
    _user?.age = age;
    notifyListeners();
  }

  void removeUser() {
    _user = null;
    notifyListeners();
  }

  void addProfession() {
    _user?.professions.add('Profession #${user!.professions.length + 1}');
    notifyListeners();
  }
}
