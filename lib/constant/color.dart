import 'package:flutter/material.dart';

const Color primaryColor = Color(0xffED7402);
const Color accentColor = Color(0xffFDAD2B);
const Color secondaryPurple = Color(0xffFFE7E6);
const Color secondaryAccentColor = Color(0xffFEF4E1);

Color secondaryColor = Color(0xffFEF4E1);
Color primaryText = Color(0xff262626);
Color textSecondary = Color(0xff7B7B7B);
Color primaryBackground = Color(0xffF1F4F8);
Color secondaryBackground = Color(0xffFFFFFF);
Color alternate = Color(0xff434343);

Color blue = Color(0xff096ADB);
Color green = Color(0xff00A600);
Color greenLight = Color(0xff6cacc7);
Color red = Color(0xffFB180D);
Color secondaryRed = Color(0xffFF2B18);
Color secondaryBlue = Color(0xffE3F3FF);

const Color black = Colors.black;
const Color white = Colors.white;

void applyThem(bool dark) {
  if (dark) {
    // secondaryColor = Color(0xffFEF4E1);
    primaryText = Color(0xffFFFFFF);
    textSecondary = Color(0xffD9D9D9);
    primaryBackground = Color(0xff121212);
    secondaryBackground = Color(0xff262626);
    alternate = Color(0xff434343);
  } else {
    // secondaryColor = Color(0xffFEF4E1);
    primaryText = Color(0xff262626);
    textSecondary = Color(0xff7B7B7B);
    primaryBackground = Color(0xffF1F4F8);
    secondaryBackground = Color(0xffFFFFFF);
    alternate = Color(0xffF5F5F5);
  }
}
