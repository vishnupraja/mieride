import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mie_ride/utils/colors.dart';
import 'package:mie_ride/utils/text_field.dart';

class AddRateManagement extends StatefulWidget {
  const AddRateManagement({Key? key}) : super(key: key);

  @override
  State<AddRateManagement> createState() => _AddRateManagementState();
}

class _AddRateManagementState extends State<AddRateManagement> {
  TextEditingController rideCtr = TextEditingController();
  TextEditingController privateCtr = TextEditingController();

  var _chosenValue = null;
  var dropValue = null;
  List<String> city1 = [
    'Indore',
    'Bhopal',
    'Ujjain',
  ];
  List<String> city2 = [
    'Indore',
    'Bhopal',
    'Ujjain',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.secondry,
        title: Text('Add Vehicle'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 1,
                        color: MyColors.secondry,
                        blurStyle: BlurStyle.outer),
                  ],
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  border: Border.all(color: MyColors.secondry, width: 0)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    dropdownColor: MyColors.primary,
                    hint: const Text(
                      'Select City',
                      style: TextStyle(color: MyColors.hintColor),
                    ),
                    alignment: Alignment.center,
                    value: _chosenValue,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 25,
                    ),
                    isExpanded: true,
                    items: city1.map(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              value,
                              maxLines: 2,
                              softWrap: false,
                            ),
                          ),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      setState(
                        () {
                          _chosenValue = value;
                          print("value===>$_chosenValue");
                        },
                      );
                    }),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 1,
                        color: MyColors.secondry,
                        blurStyle: BlurStyle.outer),
                  ],
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  border: Border.all(color: MyColors.secondry, width: 0)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    dropdownColor: MyColors.primary,
                    hint: const Text(
                      'Select City',
                      style: TextStyle(color: MyColors.hintColor),
                    ),
                    alignment: Alignment.center,
                    value: dropValue,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 25,
                    ),
                    isExpanded: true,
                    items: city2.map(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              value,
                              maxLines: 2,
                              softWrap: false,
                            ),
                          ),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      setState(
                        () {
                          dropValue = value;
                          print("value===>$dropValue");
                        },
                      );
                    }),
              ),
            ),
            custom_textfield(
              labletext: "Ride Share Price",
              textInputType: TextInputType.number,
              textEditingController: rideCtr,
            ),
            custom_textfield(
              labletext: "Private Ride Price",
              textEditingController: privateCtr,
              textInputType: TextInputType.number,
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: custom_button(
          voidCallback: () {
            Get.back();
          },
          text: 'Add Vehicle',
        ),
      ),
    );
  }
}
