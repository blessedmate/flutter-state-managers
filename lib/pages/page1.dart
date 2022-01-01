import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_singleton/bloc/user/user_cubit.dart';
import 'package:flutter_singleton/models/user.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
        actions: [
          IconButton(
            onPressed: context.read<UserCubit>().deleteUser,
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      // Build the widget using cubit
      body: const StateManager(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'page2'),
      ),
    );
  }
}

class StateManager extends StatelessWidget {
  const StateManager({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (_, state) {
      // if (state is UserInitial) {
      //   return const Center(child: Text('No user info'));
      // } else if (state is UserActive) {
      //   return UserInfo(user: state.user);
      // } else {
      //   return const Center(child: CircularProgressIndicator());
      // }

      switch (state.runtimeType) {
        case UserInitial:
          return const Center(child: Text('No user info'));
        case UserActive:
          return UserInfo(user: (state as UserActive).user);
        default:
          return const Center(child: CircularProgressIndicator());
      }
    });
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
          // ListTile(title: Text('Profession 1')),
          ...user.professions.map((p) => ListTile(title: Text(p))).toList()
        ],
      ),
    );
  }
}
