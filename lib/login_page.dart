import 'package:flutter/material.dart';

import 'constant.dart';
import 'custom_widget.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryBackground,
        elevation: 3,
        title: Text("klio"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: topBarIconBtn(
                'assets/moon.png', primaryBackground, primaryColor, 10, 25, 35,
                onPressed: () {
              // darkMode
              //     ? darkMode = false
              //     : darkMode = true;
              // applyThem(darkMode);
              // setState(() {});
            }),
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          height: 400,
          width: 330,
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Container(
              height: Size.infinite.height,
              width:  Size.infinite.width,
              padding: EdgeInsets.all(30),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(
                     'Staff Login',
                     style: TextStyle(
                         fontSize: fontVeryBig,
                         fontWeight: FontWeight.bold,
                         color: primaryText),
                   ),
                   SizedBox(height: 10),
                   Text('Enter your details to sign in your user account',
                       style: TextStyle(
                           fontSize: fontVerySmall, color: textSecondary)),
                   SizedBox(height: 30),
                   SizedBox(
                     height: 40,
                     child: TextFormField(
                         onChanged: (text) async {},
                         onEditingComplete: () async {},
                         keyboardType: TextInputType.text,
                         style: TextStyle(
                             fontFamily: 'Poppins',
                             fontSize: fontSmall,
                             color: primaryText),
                         decoration: InputDecoration(
                             fillColor: textSecondary,
                             suffixIcon: Image.asset('assets/user.png', color: textSecondary,),
                             border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(40),
                             ),
                             hintStyle: TextStyle(
                                 fontFamily: 'Poppins',
                                 fontSize: fontSmall,
                                 color: primaryText),
                             hintText: 'Username')),
                   ),
                   SizedBox(height: 10),
                   SizedBox(
                     height: 40,
                     child: TextFormField(
                         onChanged: (text) async {},
                         onEditingComplete: () async {},
                         keyboardType: TextInputType.text,
                         style: TextStyle(
                             fontFamily: 'Poppins',
                             fontSize: fontSmall,
                             color: primaryText),
                         decoration: InputDecoration(
                             fillColor: textSecondary,
                             suffixIcon: Image.asset('assets/hide.png',color: textSecondary,),
                             border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(40),
                             ),
                             hintStyle: TextStyle(
                                 fontFamily: 'Poppins',
                                 fontSize: fontSmall,
                                 color: primaryText),
                             hintText: 'Password')),
                   ),
                   SizedBox(height: 30),
                   normalButton('Login', primaryColor, white, onPressed: () {
                     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>HomePageWidget()));
                   }),
                 ],
               ),
            ),
          ),
        ),
      ),
      backgroundColor: secondaryBackground,
    );
  }
}
