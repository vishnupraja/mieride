import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:mie_ride/controller/city_controller.dart';
import 'package:mie_ride/rout_helper/rout_helper.dart';
import '../../../utils/colors.dart';
import '../../../utils/text_field.dart';

class AddCity extends StatefulWidget {
  const AddCity({Key? key}) : super(key: key);

  @override
  State<AddCity> createState() => _AddCityState();
}

class _AddCityState extends State<AddCity> {
  CityController controller = Get.put(CityController());
  TextEditingController cityCtr = TextEditingController();


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
        backgroundColor: MyColors.gradiant,
        title: Text("View City"),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (controller.isLoadings.value) {
            return Center(
              child: myIndicator(),
            );
          } else if (controller.CityList.length == 0) {
            return Center(
              child: Text("No City Added"),
            );
          } else {
            return ListView.builder(
              itemCount: controller.CityList.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                var reverseList = controller.CityList.reversed.toList();
                var list = reverseList[index];
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 30,
                          color: MyColors.listGradiant,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "City Name",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: MyColors.secondry,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(list.cityName,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: MyColors.secondry,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Container(
                          height: 30,
                          color: MyColors.listGradiant,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Status",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: MyColors.secondry,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(list.status,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: MyColors.secondry,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: custom_button(
          voidCallback: () {
            _showTextInputDialog(context);
           /* Get.toNamed(RouteHelper.getAddCityFieldScreenRoute());*/
          },
          text: 'Add City',
        ),
      ),
    );
  }

  Future<String?> _showTextInputDialog(
      BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/cityImage.png'),
                SizedBox(
                  height: 10,
                ),
                Text("Enter City Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),)
              ],
            ),
            content: Container(
              height: 50,
              decoration: BoxDecoration(
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
              ),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: cityCtr,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: MyColors.textFieldBack,
                    border: InputBorder.none
                ),
              ),
            ),
            actions: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Obx(
                        () => custom_button(
                            loading: controller.isLoading.value,
                        voidCallback: () {
                          getLatLong();
                        },
                        text: "Submit"),
                  ))
            ],
          );
        });
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
