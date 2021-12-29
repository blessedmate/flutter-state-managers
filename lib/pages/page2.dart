import 'package:flutter/material.dart';
import 'package:flutter_singleton/models/user.dart';
import 'package:flutter_singleton/services/user_service.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: userService.userStream,
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            return snapshot.hasData
                ? Text('Name: ${snapshot.data!.name}')
                : const Text('Page 2');
          },
        ),
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
                final newUser = User(name: 'Mate', age: 21, professions: []);
                userService.loadUser(newUser);
              },
            ),
            MaterialButton(
              child: const Text('Modify age',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                userService.changeAge(30);
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
