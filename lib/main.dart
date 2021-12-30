import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_singleton/services/user_service.dart';
import 'package:flutter_singleton/pages/page1.dart';
import 'package:flutter_singleton/pages/page2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserService(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'page1',
        routes: {
          'page1': (_) => const Page1(),
          'page2': (_) => const Page2(),
        },
      ),
    );
  }
}
