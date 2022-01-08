import 'package:flutter_singleton/models/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var userExists = false.obs;
  var user = User().obs;

  int get professionsLength => user.value.professions.length;

  void loadUser(User pUser) {
    userExists.value = true;
    user.value = pUser;
  }

  void changeAge(int age) {
    user.update((val) {
      val!.age = age;
    });
  }

  void addProfession(String profession) {
    user.update((val) {
      val!.professions = [...val.professions, profession];
    });
  }
}
