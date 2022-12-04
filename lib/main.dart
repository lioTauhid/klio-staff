import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klio_staff/mvc/view/page/kitchen.dart';
import 'package:klio_staff/service/local/shared_pref.dart';
import 'constant/value.dart';
import 'mvc/view/page/home.dart';
import 'mvc/view/page/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  token = await SharedPref().getValue('token') ?? '';
  loginType = await SharedPref().getValue('loginType') ?? '';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (token == '') {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.orange, fontFamily: 'Nunito'),
        home: const Login(),
      );
    } else {
      if (loginType == loginTypes[1]) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.orange, fontFamily: 'Nunito'),
          home: const Kitchen(),
        );
      } else {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.orange, fontFamily: 'Nunito'),
          home: const Home(),
        );
      }
    }
  }
}
