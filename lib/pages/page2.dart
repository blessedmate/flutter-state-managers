import 'package:flutter/material.dart';
import 'package:flutter_singleton/models/user.dart';
import 'package:flutter_singleton/services/user_service.dart';
import 'package:provider/provider.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);

    return Scaffold(
      appBar: AppBar(
        title: userService.userExists
            ? Text(userService.user!.name)
            : const Text('Page 2'),
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
                // Provider instance must have listen = false inside an onPressed
                // since there's nothing to rebuild
                // final userService =
                //     Provider.of<UserService>(context, listen: false);

                User newUser = User(
                  name: 'Mate',
                  age: 21,
                  professions: ['Fullstack', 'Frontend', 'Backend'],
                );
                userService.user = newUser;
              },
            ),
            MaterialButton(
              child: const Text('Modify age',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () => userService.changeAge(35),
            ),
            MaterialButton(
              child: const Text('Add profession',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: userService.addProfession,
            ),
          ],
        ),
      ),
    );
  }
}
