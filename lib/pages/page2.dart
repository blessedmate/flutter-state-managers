import 'package:flutter/material.dart';
import 'package:flutter_singleton/controllers/user_controller.dart';
import 'package:flutter_singleton/models/user.dart';
import 'package:get/get.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // print(Get.arguments);
    final userController = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child:
                  const Text('Set user', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                userController.loadUser(User(name: 'Blessedmate', age: 21));
                Get.snackbar(
                  'New user',
                  'User was succesfully created',
                  backgroundColor: Colors.white,
                  boxShadows: [
                    const BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10,
                    ),
                  ],
                );
              },
            ),
            MaterialButton(
              child: const Text('Modify age',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                userController.changeAge(25);
              },
            ),
            MaterialButton(
              child: const Text('Add profession',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                userController.addProfession(
                    'Profession #${userController.professionsLength + 1}');
              },
            ),
            MaterialButton(
              child: const Text('Change Theme',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                Get.changeTheme(
                    Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              },
            ),
          ],
        ),
      ),
    );
  }
}
