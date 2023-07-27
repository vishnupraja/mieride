import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride/utils/text_field.dart';
import '../../../controller/surge_price_controller.dart';
import '../../../utils/colors.dart';

class SurgePriceAdd extends StatefulWidget {
  const SurgePriceAdd({Key? key}) : super(key: key);

  @override
  State<SurgePriceAdd> createState() => _SurgePriceAddState();
}

class _SurgePriceAddState extends State<SurgePriceAdd> {

  SurgePriceController controller = Get.put(SurgePriceController());

  TextEditingController typeCtr = TextEditingController();
  TextEditingController timeCtr = TextEditingController();
  TextEditingController priceCtr = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      appBar: AppBar(
        backgroundColor: MyColors.secondry,
        title: Text("Surge Add"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            custom_textfield(
              labletext: "Surge Type",
              textInputType: TextInputType.text,
              textEditingController: typeCtr, hintText: 'Surge Type',
            ),
            custom_textfield(
              labletext: "Surge time",
              textInputType: TextInputType.text,
              textEditingController: timeCtr, hintText: 'Surge Type',
            ),
            custom_textfield(
              labletext: "Extra Price",
              textInputType: TextInputType.text,
              textEditingController: priceCtr, hintText: 'Surge Type',
            ),
            SizedBox(
              height: 30,
            ),
           Obx(() =>  custom_button(
             loading: controller.isLoadings.value,
               voidCallback: () {

           }, text: "Add Surge Price"),)
          ],
        ),
      ),
    );
  }
}
