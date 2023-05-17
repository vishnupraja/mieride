import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride/utils/colors.dart';
import '../../../controller/ride_management_controller.dart';
import '../../../rout_helper/rout_helper.dart';
import '../../../utils/text_field.dart';

class RateManagement extends StatefulWidget {
  const RateManagement({Key? key}) : super(key: key);

  @override
  State<RateManagement> createState() => _RateManagementState();
}

class _RateManagementState extends State<RateManagement> {

  RideManagementController controller = Get.put(RideManagementController());

  @override
  void initState() {
    controller.adminCityPriceFetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      appBar: AppBar(
        backgroundColor: MyColors.secondry,
        title: Text('Rate Management'),
        centerTitle: true,
      ),
      body: Obx((){
        if(controller.isLoadings.value){
          return Center(child: myIndicator(),);
        }else if(controller.rateList.length == 0){
          return Center(child: Text("No Price Added"),);
        }else{
          return ListView.builder(
            itemCount: controller.rateList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              var list = controller.rateList[index];
              return InkWell(
                onTap: () {},
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
                                    "City Name(Source)",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: MyColors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(list.city1Name,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: MyColors.secondry,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "City Name(Destination)",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: MyColors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    list.city2Name,
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: MyColors.secondry,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Ride Share Price",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: MyColors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(list.rideSharePrice,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: MyColors.secondry,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Private Ride Price",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: MyColors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    list.privateRidePrice,
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: MyColors.secondry,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: custom_button(
          voidCallback: () {
            Get.toNamed(RouteHelper.getAddRateManagementScreenRoute());
          },
          text: 'Add Rate',
        ),
      ),
    );
  }
}
