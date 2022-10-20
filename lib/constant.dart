import 'package:flutter/material.dart';

const Color primaryColor = Color(0xffED7402);
const Color secondaryColor = Color(0xff30ACFF);
const Color accentColor = Color(0xffFDAD2B);

Color primaryText = Color(0xff262626);
Color textSecondary = Color(0xff7B7B7B);
Color primaryBackground = Color(0xffF1F4F8);
Color secondaryBackground = Color(0xffFFFFFF);
Color alternate = Color(0xff434343);

const Color black = Colors.black;
const Color white = Colors.white;

const fontVeryBig = 26.0;
const fontBig = 22.0;

const fontMediumExtra = 18.0;
const fontMedium = 16.0;

const fontSmall = 14.0;
const fontVerySmall = 12.0;

const dialogPadding = 20.0;


void applyThem(bool dark) {
  if (dark) {
    primaryText = Color(0xffFFFFFF);
    textSecondary = Color(0xffD9D9D9);
    primaryBackground = Color(0xff121212);
    secondaryBackground = Color(0xff262626);
    alternate = Color(0xff434343);
  }else{
    primaryText = Color(0xff262626);
    textSecondary = Color(0xff7B7B7B);
    primaryBackground = Color(0xffF1F4F8);
    secondaryBackground = Color(0xffFFFFFF);
    alternate = Color(0xffF5F5F5);
  }
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
    ),
    duration: Duration(seconds: 5),
    backgroundColor: accentColor,
    action: SnackBarAction(
      label: 'Ok',
      textColor: secondaryColor,
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  ));
}

showWarningDialog(BuildContext context, String message, {Function? onAccept}) {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Row(
          children: [
            Icon(
              Icons.warning,
              color: Colors.orange,
            ),
            Text(' Warning!'),
          ],
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              onAccept;
            },
            child: Text("Yes"),
          ),
          TextButton(
            child: Text("No"),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      );
    },
  );
}
