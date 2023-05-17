import 'package:flutter/material.dart';
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


  @override
  void initState() {
    controller.adminCityFetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      appBar: AppBar(
        title: Text("View City"),
        centerTitle: true,
        backgroundColor: MyColors.secondry,
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
                var list = controller.CityList[index];
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 50, right: 20, top: 10, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "City Name",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: MyColors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    list.cityName,
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: MyColors.secondry,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Status",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: MyColors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    list.status,
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: MyColors.secondry,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
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
            Get.toNamed(RouteHelper.getAddCityFieldScreenRoute());
          },
          text: 'Add City',
        ),
      ),
    );
  }
}
