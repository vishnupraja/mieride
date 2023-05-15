import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:mie_ride/controller/city_controller.dart';
import 'package:mie_ride/utils/text_field.dart';
import '../../../utils/colors.dart';

class AddCityField extends StatefulWidget {
  const AddCityField({Key? key}) : super(key: key);

  @override
  State<AddCityField> createState() => _AddCityFieldState();
}

class _AddCityFieldState extends State<AddCityField> {

  TextEditingController cityCtr = TextEditingController();
  CityController controller = Get.put(CityController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      backgroundColor: MyColors.primary,
      appBar: AppBar(
        title: Text("Add City"),
        centerTitle: true,
        backgroundColor: MyColors.secondry,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  custom_textfield(labletext: "Enter City Name",
                    textEditingController: cityCtr,
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(height: 20,),
                  custom_button(
                      loading: controller.isLoading.value,
                      voidCallback: (){
                    getLatLong();
                  }, text: "Submit"),
                ],
              ),
            ),
          ),
        ),
      ),
    ),);
  }


  Future<void> getLatLong() async {
    List<Location> locations =
    await locationFromAddress(cityCtr.text.toString());

    controller.longitude.value = locations.last.longitude.toString();
    controller.latitude.value = locations.last.latitude.toString();
    print('input address longitude---->${controller.longitude.value}');
    print('input address latitude---->${controller.latitude.value}');
    controller.adminAddCity(context, cityCtr.text);

  }

}
