import 'package:flutter/material.dart';
import 'package:flutter_singleton/controllers/user_controller.dart';
import 'package:flutter_singleton/models/user.dart';
import 'package:flutter_singleton/pages/page2.dart';
import 'package:get/get.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: Obx(
        () => userController.userExists.value
            ? UserInfo(user: userController.user.value)
            : const Center(child: Text('No user info')),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.accessibility_new),
        // onPressed: () => Navigator.pushNamed(context, 'page2'),
        onPressed: () =>
            Get.toNamed('page2', arguments: {'name': 'Blessedmate'}),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  final User user;

  const UserInfo({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ListTile(title: Text('Name: ${user.name}')),
          ListTile(title: Text('Age: ${user.age}')),
          const Text(
            'Professions',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ...user.professions
              .map((p) => ListTile(
                    title: Text(p),
                  ))
              .toList()
        ],
      ),
    );
  }
}
