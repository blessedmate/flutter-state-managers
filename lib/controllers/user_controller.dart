import 'package:flutter_singleton/models/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var userExists = false.obs;
  var user = User().obs;

  void loadUser(User pUser) {
    userExists.value = true;
    user.value = pUser;
  }

  void changeAge(int age) {
    user.update((val) {
      val!.age = age;
    });
  }
}
