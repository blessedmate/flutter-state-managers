import 'dart:async';

import 'package:flutter_singleton/models/user.dart';

class _UserService {
  User? _user;

  final StreamController<User> _userStreamController =
      StreamController<User>.broadcast();

  User? get user => _user;
  bool get userExists => (_user != null) ? true : false;
  Stream<User> get userStream => _userStreamController.stream;

  void loadUser(User user) {
    _user = user;
    _userStreamController.add(user);
  }

  void changeAge(int age) {
    if (_user != null) {
      _user!.age = age;
      _userStreamController.add(_user!);
    }
  }
}

final userService = _UserService();
