import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klio_staff/service/local/shared_pref.dart';
import 'package:klio_staff/view/page/home.dart';

import 'view/page/login.dart';

late final token;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  token = await SharedPref().getValue('token');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if(token == null || token == ''){
      return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const Login(),
      );
    }else{
      return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const Home(),
      );
    }

  }
}