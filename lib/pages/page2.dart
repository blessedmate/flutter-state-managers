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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
