import 'package:flutter/material.dart';

import '../../../constant/color.dart';
import '../../../constant/value.dart';

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
  return Expanded(
    child: MaterialButton(
      elevation: 0,
      onPressed: onPressed,
      color: background,
      height: 40,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
    ),
  );
}

Widget topBarIconBtn(
    Image image, Color background, double padding, double radius, double size,
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
        child: image),
  );
}

Widget iconTextBtn(
    String imagePath, String text, Color background, Color iconColor,
    {Function()? onPressed}) {
  return SizedBox(
    width: 80,
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
        Text(text,
            style: TextStyle(color: primaryText, fontSize: fontVerySmall)),
      ],
    ),
  );
}

Widget iconTextBtnWide(
    String imagePath, String text, Color backColor, Color contentColor,
    {Function()? onPressed}) {
  return Container(
    width: 110,
    height: 60,
    decoration: BoxDecoration(
        color: backColor, borderRadius: BorderRadius.circular(10)),
    child: MaterialButton(
      elevation: 0,
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            color: contentColor,
          ),
          Text(text,
              style: TextStyle(color: contentColor, fontSize: fontVerySmall)),
        ],
      ),
    ),
  );
}

Widget normalButton(String text, Color background, Color textColor,
    {Function()? onPressed}) {
  return MaterialButton(
      elevation: 0,
      color: background,
      height: 40,
      minWidth: 150,
      padding: EdgeInsets.all(15),
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(400.0),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: fontSmall),
      ));
}

Widget normalTextField(TextEditingController controller) {
  return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: fontSmall, color: primaryText),
      decoration: InputDecoration(
        fillColor: secondaryBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ));
}

Widget textMixer(
    String boldText, String normalText, MainAxisAlignment alignment) {
  return Row(
    mainAxisAlignment: alignment,
    children: [
      Text(
        boldText,
        style: TextStyle(
            fontSize: fontVerySmall,
            color: primaryText,
            fontWeight: FontWeight.bold),
      ),
      Text(
        normalText,
        style: TextStyle(fontSize: fontVerySmall, color: textSecondary),
      ),
    ],
  );
}

Widget textRow1(String text1, String text2) {
  return Row(
    children: [
      Expanded(
        flex: 1,
        child: Text(
          text1,
          style: TextStyle(
              fontSize: fontVerySmall,
              color: textSecondary,
              fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(width: 8),
      Expanded(
        flex: 1,
        child: Text(
          text2,
          style: TextStyle(
              fontSize: fontVerySmall,
              color: textSecondary,
              fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}

Widget textFieldRow1(String text1, String text2) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Expanded(
          flex: 1,
          child: SizedBox(
            height: 35,
            child: TextFormField(
                onChanged: (text) async {},
                onEditingComplete: () async {},
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: fontVerySmall, color: textSecondary),
                decoration: InputDecoration(
                    fillColor: secondaryBackground,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    hintStyle: TextStyle(
                        fontSize: fontVerySmall, color: textSecondary),
                    hintText: text1)),
          )),
      SizedBox(width: 8),
      Expanded(
          flex: 1,
          child: SizedBox(
            height: 35,
            child: TextFormField(
                onChanged: (text) async {},
                onEditingComplete: () async {},
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: fontVerySmall, color: textSecondary),
                decoration: InputDecoration(
                    fillColor: secondaryBackground,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    hintStyle: TextStyle(
                        fontSize: fontVerySmall, color: textSecondary),
                    hintText: text2)),
          )),
    ],
  );
}