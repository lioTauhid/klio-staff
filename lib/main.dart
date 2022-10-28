import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klio_staff/service/local/shared_pref.dart';
import 'constant/value.dart';
import 'mvc/view/page/home.dart';
import 'mvc/view/page/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  token = await SharedPref().getValue('token') ?? '';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (token == '') {
      return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.orange, fontFamily: 'Nunito'),
        home: const Login(),
      );
    } else {
      return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.orange, fontFamily: 'Nunito'),
        home: const Home(),
      );
    }
  }
}
