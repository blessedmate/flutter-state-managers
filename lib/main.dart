import 'package:flutter/material.dart';
import 'package:flutter_singleton/pages/page1.dart';
import 'package:flutter_singleton/pages/page2.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'page1',
      // routes: {
      //   'page1': (_) => const Page1(),
      //   'page2': (_) => const Page2(),
      // },
      getPages: [
        GetPage(name: '/page1', page: () => const Page1()),
        GetPage(name: '/page2', page: () => const Page2()),
      ],
    );
  }
}
