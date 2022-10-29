import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:klio_staff/service/api/api_client.dart';
import 'package:klio_staff/service/local/shared_pref.dart';

import '../../../constant/color.dart';
import '../../../constant/value.dart';
import '../../../utils/utils.dart';
import '../widget/custom_widget.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPass.dispose();
    super.dispose();
  }

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
                Image.asset('assets/moon.png', color: primaryColor), primaryBackground, 10, 25, 35,
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
               child: Form(
                 key: formKey,
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
                       height: 60,
                       child: TextFormField(
                           onChanged: (text) async {},
                           onEditingComplete: () async {},
                           keyboardType: TextInputType.text,
                           controller: controllerEmail,
                           validator: (value){
                             if(Utils.isEmailValid(value!)){
                               return null;
                             }else{
                               return "Invalid Email";
                             }
                           },
                           style: TextStyle(
                               fontSize: fontVerySmall,
                               color: primaryText),
                           decoration: InputDecoration(
                               fillColor: textSecondary,
                               suffixIcon: Image.asset('assets/user.png', color: textSecondary,),
                               hintText: "Username",
                               labelText: "Email Address",
                               border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(40),
                               ),
                               hintStyle: TextStyle(
                                   fontSize: fontVerySmall,
                                   color: primaryText),)),
                     ),
                     SizedBox(height: 10),
                     SizedBox(
                       height: 60,
                       child: TextFormField(
                           onChanged: (text) async {},
                           onEditingComplete: () async {},
                           keyboardType: TextInputType.text,
                           obscureText: true,
                           controller: controllerPass,
                           validator: (value){
                             if(Utils.isPasswordValid(value!)){
                               return null;
                             }else{
                               return "Minimum password length is six";
                             }
                           },
                           style: TextStyle(
                               fontSize: fontVerySmall,
                               color: primaryText),
                           decoration: InputDecoration(
                               fillColor: textSecondary,
                               suffixIcon: Image.asset('assets/hide.png',color: textSecondary,),
                               hintText: "Password",
                               labelText: "Password",
                               border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(40),
                               ),
                               hintStyle: TextStyle(
                                   fontSize: fontVerySmall,
                                   color: primaryText),)),
                     ),
                     SizedBox(height: 30),
                     normalButton('Login', primaryColor, white, onPressed: () async {
                       if(formKey.currentState!.validate()){
                         Utils.showLoading();
                         formKey.currentState!.save();
                         var response = await ApiClient().post('login', {
                           "email": controllerEmail.text,
                           "password": controllerPass.text
                         }).catchError((e){
                           Utils.showSnackBar("Invalid Username or Password");
                         });
                         Utils.hideLoading();
                         if (response == null) return;
                         Utils.showSnackBar(jsonDecode(response)["message"]);
                         await SharedPref().saveValue('token', jsonDecode(response)["token"]);
                         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>Home()));
                       }
                     }),
                   ],
                 ),
               ),
            ),
          ),
        ),
      ),
      backgroundColor: secondaryBackground,
    );
  }
}
