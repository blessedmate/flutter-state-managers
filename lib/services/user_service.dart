import 'package:flutter_singleton/models/user.dart';

class _UserService {
  User? _user;

  User? get user => _user;

  bool get userExists => (_user != null) ? true : false;

  void loadUser(User user) {
    _user = user;
  }
}

final userService = _UserService();
