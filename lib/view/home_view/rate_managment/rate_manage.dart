import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride/network/urls.dart';
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
                        Container(
                          height: 30,
                          color: MyColors.listGradiant,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "City Name(Source)",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: MyColors.secondry,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(list.city1Name,
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
                                  "City Name(Destination)",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: MyColors.secondry,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(list.city2Name,
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
                                  "Ride Share Price",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: MyColors.secondry,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(currency+" "+list.rideSharePrice,
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
                                  "Private Ride Price",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: MyColors.secondry,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(currency+" "+list.privateRidePrice,
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
