import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride/utils/SnackBar.dart';
import 'package:mie_ride/utils/colors.dart';
import 'package:mie_ride/utils/text_field.dart';
import '../../../controller/city_controller.dart';
import '../../../controller/ride_management_controller.dart';

class AddRateManagement extends StatefulWidget {
  const AddRateManagement({Key? key}) : super(key: key);

  @override
  State<AddRateManagement> createState() => _AddRateManagementState();
}

class _AddRateManagementState extends State<AddRateManagement> {

  TextEditingController rideCtr = TextEditingController();
  TextEditingController privateCtr = TextEditingController();
  CityController controller = Get.put(CityController());
  RideManagementController rideManagementController = Get.put(RideManagementController());

  var _chosenValue = null;
  var dropValue = null;

  @override
  void initState() {
    controller.adminCityFetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)
            )
        ),
        centerTitle: true,
        backgroundColor: MyColors.gradiant,
        title: Text('Add Rate'),
      ),
      body: Obx(
        () {
          if (controller.isLoadings.value) {
            return Center(
              child: myIndicator(),
            );
          } else {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Select City"),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: MyColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 8.0, // soften the shadow
                            spreadRadius: 2.0, //extend the shadow
                            offset: Offset(
                              0.0, // Move to right 5  horizontally
                              0.0, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                       ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        dropdownColor: MyColors.gradiant,
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
                        items: controller.CityList.map(
                          (value) {
                            return DropdownMenuItem<String>(
                              value: value.cityId,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  value.cityName,
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
                              print("first ---->:$_chosenValue");
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Select Second City"),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: MyColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 8.0, // soften the shadow
                            spreadRadius: 2.0, //extend the shadow
                            offset: Offset(
                              0.0, // Move to right 5  horizontally
                              0.0, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                       ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          dropdownColor: MyColors.gradiant,
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
                          items: controller.CityList.map(
                            (value) {
                              return DropdownMenuItem<String>(
                                value: value.cityId,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    value.cityName,
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
                                print("second ------>:$dropValue");
                              },
                            );
                          }),
                    ),
                  ),
                  custom_textfield(
                    labletext: "Ride Share Price",
                    textInputType: TextInputType.number,
                    textEditingController: rideCtr, hintText: 'Ride Share Price',
                  ),
                  custom_textfield(
                    labletext: "Private Ride Price",
                    textEditingController: privateCtr,
                    textInputType: TextInputType.number, hintText: 'Ride Share Price',
                  )
                ],
              ),
            );
          }
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Obx(() => custom_button(
          loading: rideManagementController.isLoading.value,
          voidCallback: () {
            if(validation() == true){
              rideManagementController.adminAddCityPrice(context, _chosenValue.toString(),
                  dropValue.toString(), rideCtr.text, privateCtr.text);
            }

          },
          text: 'Add Rate',
        ),)
      ),
    );
  }

  bool validation(){
    if(_chosenValue == null){
      showCustomSnackBar("please choose city", context);
    }else if(dropValue == null){
      showCustomSnackBar("please choose city", context);
    }else if(rideCtr.text.isEmpty){
      showCustomSnackBar("please choose Ride Share Price", context);
    }else if(privateCtr.text.isEmpty){
      showCustomSnackBar("please choose Private Ride Price", context);
    }else{
      return true;
    }
    return  false;
  }

}
