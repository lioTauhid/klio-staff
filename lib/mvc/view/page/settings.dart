import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../constant/color.dart';
import '../../../constant/constant.dart';
import '../../../constant/value.dart';
import '../../../service/api/api_client.dart';
import '../../../utils/utils.dart';
import '../dialog/custom_dialog.dart';
import '../widget/custom_widget.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  TextEditingController contResName =
      TextEditingController(text: homeController.settings.value.data![0].value);
  TextEditingController contEmail =
      TextEditingController(text: homeController.settings.value.data![2].value);
  TextEditingController contPhone =
      TextEditingController(text: homeController.settings.value.data![3].value);
  TextEditingController contRight = TextEditingController(
      text: homeController.settings.value.data![17].value);
  TextEditingController contAddress = TextEditingController(
      text: homeController.settings.value.data![16].value);
  TextEditingController contDescription =
      TextEditingController(text: homeController.settings.value.data![1].value);
  String selectedDate =
      homeController.settings.value.data![10].value.toString();
  String selectedTime = homeController.settings.value.data![9].value.toString();

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
          textFieldRow1('Klio', 'info@deepgreen.studio',
              controller1: contResName, controller2: contEmail),
          SizedBox(height: 15),
          textRow1('Timezone', 'Date Format'),
          timeDateDropDown(timeZones, dateFormats),
          SizedBox(height: 15),
          textRow1('Phone', 'Copyright'),
          textFieldRow1('+880176456455', 'All rights reserved',
              controller1: contPhone, controller2: contRight),
          SizedBox(height: 15),
          textRow1('Address', ''),
          SizedBox(
            height: 60,
            child: TextFormField(
                controller: contAddress,
                keyboardType: TextInputType.text,
                maxLines: 3,
                style: TextStyle(fontSize: fontVerySmall, color: primaryText),
                decoration: InputDecoration(
                    fillColor: secondaryBackground,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ))),
          ),
          SizedBox(height: 15),
          textRow1('Restaurant Descriptions', ''),
          SizedBox(
            height: 60,
            child: TextFormField(
                controller: contDescription,
                keyboardType: TextInputType.text,
                maxLines: 3,
                style: TextStyle(fontSize: fontVerySmall, color: primaryText),
                decoration: InputDecoration(
                    fillColor: secondaryBackground,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ))),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              normalButton('Submit', primaryColor, white, onPressed: () async {
                Utils.showLoading();
                var response = await ApiClient().put(
                    'setting',
                    jsonEncode({
                      "email": contEmail.text,
                      "phone": contPhone.text,
                      "timezone": selectedTime,
                      "date_format": selectedDate,
                      "address": contAddress.text,
                      "copyright": contRight.text,
                      "restaurant_name": contResName.text,
                      "restaurant_description": contDescription.text,
                    }),
                    header: Utils.apiHeader);
                if (response == null) {
                  Utils.hidePopup();
                  Utils.showSnackBar("Failed to save setting, Try again!");
                } else {
                  Utils.hidePopup();
                  Utils.showSnackBar("Setting saved successfully!");
                }
              }),
            ],
          ),
        ]),
      ),
    );
  }

  Widget timeDateDropDown(List<String> time, List<String> date) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            flex: 1,
            child: Container(
                height: 40,
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: textSecondary, width: 1)),
                child: DropdownButton<String>(
                  items: time.map((dynamic val) {
                    return DropdownMenuItem<String>(
                      value: val.toString(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(val,
                            style: TextStyle(
                                color: primaryText, fontSize: fontVerySmall)),
                      ),
                    );
                  }).toList(),
                  borderRadius: BorderRadius.circular(6),
                  underline: SizedBox(),
                  isExpanded: true,
                  dropdownColor: primaryBackground,
                  value: selectedTime,
                  onChanged: (value) {
                    selectedTime = value!;
                    setState(() {});
                  },
                ))),
        SizedBox(width: 20),
        Expanded(
            flex: 1,
            child: Container(
                height: 40,
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: textSecondary, width: 1)),
                child: DropdownButton<String>(
                  items: date.map((dynamic val) {
                    return DropdownMenuItem<String>(
                      value: val.toString(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(val,
                            style: TextStyle(
                                color: primaryText, fontSize: fontVerySmall)),
                      ),
                    );
                  }).toList(),
                  borderRadius: BorderRadius.circular(6),
                  underline: SizedBox(),
                  isExpanded: true,
                  dropdownColor: primaryBackground,
                  value: selectedDate,
                  onChanged: (value) {
                    selectedDate = value!;
                    setState(() {});
                  },
                ))),
      ],
    );
  }
}
