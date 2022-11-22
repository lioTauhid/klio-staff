import 'package:flutter/material.dart';

import '../../../constant/color.dart';
import '../../../constant/value.dart';
import '../widget/custom_widget.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 20),
        padding: EdgeInsetsDirectional.all(20),
        decoration: BoxDecoration(
            color: secondaryBackground,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: textSecondary, width: .3)),
        child: ListView(children: [
          Text(
            'Settings',
            style: TextStyle(fontSize: fontMediumExtra, color: primaryText),
          ),
          SizedBox(
            height: 10,
          ),
          textRow1('Restaurant Name', 'Email'),
          textFieldRow1('Klio', 'info@deepgreen.studio'),
          SizedBox(height: 15),
          textRow1('Timezone', 'Date Format'),
          textFieldRow1('Asia/Dhaka', 'd-m-Y'),
          SizedBox(height: 15),
          textRow1('Phone', 'Copyright'),
          textFieldRow1('++880176456455', 'All rights reserved'),
          SizedBox(height: 15),
          textRow1('Address', ''),
          SizedBox(
            height: 60,
            child: TextFormField(
                onChanged: (text) async {},
                onEditingComplete: () async {},
                keyboardType: TextInputType.text,
                maxLines: 3,
                style: TextStyle(fontSize: fontVerySmall, color: textSecondary),
                decoration: InputDecoration(
                    fillColor: secondaryBackground,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    hintStyle: TextStyle(
                        fontSize: fontVerySmall, color: textSecondary))),
          ),
          SizedBox(height: 15),
          textRow1('Restaurant Descriptions', ''),
          SizedBox(
            height: 60,
            child: TextFormField(
                onChanged: (text) async {},
                onEditingComplete: () async {},
                keyboardType: TextInputType.text,
                maxLines: 3,
                style: TextStyle(fontSize: fontVerySmall, color: textSecondary),
                decoration: InputDecoration(
                    fillColor: secondaryBackground,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    hintStyle: TextStyle(
                        fontSize: fontVerySmall, color: textSecondary))),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              normalButton('Submit', primaryColor, white, onPressed: () {}),
            ],
          ),
        ]),
      ),
    );
  }
}
