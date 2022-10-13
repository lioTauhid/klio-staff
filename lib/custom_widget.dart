import 'package:flutter/material.dart';

import 'constant.dart';

Widget sideBarIconBtn(String imagePath, Color color, {Function()? onPressed}) {
  return IconButton(
    icon: Image.asset(
      imagePath,
      color: color,
    ),
    onPressed: onPressed,
  );
}

Widget bottomIconTextBtn(String imagePath, String text, Color background,
    {Function()? onPressed}) {
  return MaterialButton(
    elevation: 0,
    onPressed: onPressed,
    color: background,
    minWidth: 190,
    height: 40,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.0),
    ),
    child: Row(
      children: [
        Image.asset(
          imagePath,
          color: white,
          height: 15,
          width: 15,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: TextStyle(color: white),
        )
      ],
    ),
  );
}

Widget topBarIconBtn(String imagePath, Color background, Color iconColor,
    double padding, double radius, double size,
    {Function()? onPressed}) {
  return SizedBox(
    height: size,
    width: size,
    child: MaterialButton(
        elevation: 0,
        color: background,
        padding: EdgeInsets.all(padding),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Image.asset(
          imagePath,
          color: iconColor,
        )),
  );
}

Widget iconTextBtn(
    String imagePath, String text, Color background, Color iconColor,
    {Function()? onPressed}) {
  return SizedBox(
    width: 50,
    child: Column(
      children: [
        MaterialButton(
          elevation: 0,
          height: 50,
          padding: EdgeInsets.zero,
          color: background,
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Image.asset(imagePath, color: iconColor),
        ),
        SizedBox(height: 5),
        Text(text, style: TextStyle(color: primaryText, fontSize: 10)),
      ],
    ),
  );
}

Widget iconTextBtnWide(String imagePath, String text, {Function()? onPressed}) {
  return Container(
    width: 80,
    height: 50,
    decoration: BoxDecoration(
        color: primaryColor, borderRadius: BorderRadius.circular(10)),
    child: MaterialButton(
      elevation: 0,
      onPressed: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            color: white,
          ),
          Text(text,
              style: TextStyle(color: Colors.white, fontSize: 10)),
        ],
      ),
    ),
  );
}
