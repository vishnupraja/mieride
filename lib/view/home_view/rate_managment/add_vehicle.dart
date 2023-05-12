import 'dart:convert';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mie_ride/utils/colors.dart';
import 'package:mie_ride/utils/text_field.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({Key? key}) : super(key: key);

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  TextEditingController typeCtr = TextEditingController();
  TextEditingController SeatsCtr = TextEditingController();
  TextEditingController BasesCtr = TextEditingController();
  TextEditingController PriceCtr = TextEditingController();
  TextEditingController PriceMinCtr = TextEditingController();
  TextEditingController TaxCtr = TextEditingController();
  TextEditingController CommissionCtr = TextEditingController();
  TextEditingController TimeCtr = TextEditingController();
  TextEditingController BookingCtr = TextEditingController();

  File? imagepath;
  String imageName = "", imageBase64Value = "";

  File? IconPath;
  String iconName = "", iconBaseValue = "";

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
            custom_textfield(
                textInputType: TextInputType.text,
                textEditingController: typeCtr,
                labletext: "Vehicle Type"),
            custom_textfield(
              labletext: "Available Seats/Person capacity",
              textEditingController: SeatsCtr,
              textInputType: TextInputType.number,
            ),
            custom_textfield(
              labletext: "Base Fare",
              textInputType: TextInputType.text,
              textEditingController: BasesCtr,
            ),
            custom_textfield(
              labletext: "Price Per Miles",
              textEditingController: PriceCtr,
              textInputType: TextInputType.number,
            ),
            custom_textfield(
              labletext: "Price Per Min",
              textInputType: TextInputType.number,
              textEditingController: PriceMinCtr,
            ),
            custom_textfield(
              labletext: "Tax Percentage (%)",
              textEditingController: TaxCtr,
              textInputType: TextInputType.number,
            ),
            custom_textfield(
              labletext: "Admin Commission (%)",
              textInputType: TextInputType.number,
              textEditingController: CommissionCtr,
            ),
            custom_textfield(
              labletext:
                  "Ride Booking Time (after below hours of current time)",
              textEditingController: TimeCtr,
              textInputType: TextInputType.text,
            ),
            custom_textfield(
              labletext:
                  "Ride Booking Price(after below hours of current time)",
              textInputType: TextInputType.number,
              textEditingController: BookingCtr,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    openImage(ImageSource.gallery);
                  },
                  child: Container(
                    height: 20,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey,
                    ),
                    child: Text(
                      "Select image",
                      style: TextStyle(color: MyColors.secondry),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "$imageName",
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    openIcon(ImageSource.gallery);
                  },
                  child: Container(
                    height: 20,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey,
                    ),
                    child: Text(
                      "Select Icon",
                      style: TextStyle(color: MyColors.secondry),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "$iconName",
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
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

  Future openImage(ImageSource sourceOfImage) async {
    try {
      final pickedFile = await ImagePicker.platform.getImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxHeight: 450,
        maxWidth: 450,
      );
      if (pickedFile != null) {
        imagepath = File(pickedFile.path);
        print(imagepath);
        List<int> imagebytes = imagepath!.readAsBytesSync();
        String base64string = base64.encode(imagebytes);
        print(base64string);
        setState(() {
          imageBase64Value = base64string;
          imageName = 'image_' +
              new DateTime.now().millisecondsSinceEpoch.toString() +
              '_.jpeg';
          print(imageBase64Value);
        });
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  Future openIcon(ImageSource sourceOfImage) async {
    try {
      final pickedFile = await ImagePicker.platform.getImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxHeight: 450,
        maxWidth: 450,
      );
      if (pickedFile != null) {
        IconPath = File(pickedFile.path);
        print(IconPath);
        List<int> iconbytes = IconPath!.readAsBytesSync();
        String base64stringIcon = base64.encode(iconbytes);
        print(base64stringIcon);
        setState(() {
          iconBaseValue = base64stringIcon;
          iconName = 'icon_' +
              new DateTime.now().millisecondsSinceEpoch.toString() +
              '_.jpeg';
          print(iconBaseValue);
        });
      } else {
        print("No icon is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }
}
