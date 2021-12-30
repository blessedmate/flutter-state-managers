import 'package:flutter/material.dart';
import 'package:flutter_singleton/models/user.dart';
import 'package:flutter_singleton/services/user_service.dart';
import 'package:provider/provider.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: userService.removeUser,
          ),
        ],
      ),
      body: userService.userExists
          ? UserInfo(user: userService.user!)
          : const Center(child: Text('No user info')),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'page2'),
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
          // const ListTile(title: Text('Profession 1')),
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
