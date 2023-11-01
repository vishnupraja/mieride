import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride/controller/booking_controller.dart';
import 'package:mie_ride/rout_helper/rout_helper.dart';

import '../../../utils/colors.dart';
import '../../../utils/text_field.dart';

class Driver extends StatefulWidget {
  const Driver({Key? key}) : super(key: key);

  @override
  State<Driver> createState() => _DriverState();
}

class _DriverState extends State<Driver> {

  BookingController controller = Get.put(BookingController());

  int? selectedIndex;
  String Id = "";

  @override
  void initState() {
    controller.fetchDriver();
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
        title: Text("Ride Assignment"),
        centerTitle: true,
      ),
      body: Obx((){
        if(controller.fetchDriverLoading.value){
          return Center(child: myIndicator(),);
        }else if(controller.driverList.length == 0){
          return Center(child: Text("No Driver Available"),);
        }else{
          return ListView.builder(
            itemCount: controller.driverList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              var list  = controller.driverList[index];
              return InkWell(
                onTap: (){
                  setState(() {
                    selectedIndex = index;
                    Id = list.driverId;
                  });
                },
                child: Card(
                  shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                                  "Driver Name",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: MyColors.secondry,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(list.driverName,
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
                                  "Email",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: MyColors.secondry,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(list.email,
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
                                  "Contact",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: MyColors.secondry,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(list.phone,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: MyColors.secondry,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Card(
                          color: Colors.greenAccent,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Address",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: MyColors.secondry,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: Get.width/2,
                                  child: Text( list.address,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: MyColors.secondry,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Align(
                          alignment: Alignment.bottomRight,
                          child:  selectedIndex == index?Icon(Icons.check_circle,color: MyColors.green,):null,
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
        bottomNavigationBar: Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          child: Obx(() => custom_button(
            loading: controller.driverLoading.value,

            voidCallback: () {
               print(Get.arguments["id"]);
               print(Id);
               controller.allotDriver(context, Get.arguments["id"], Id,Get.arguments["bonus"], () {
                 Get.offNamed(RouteHelper.getHomePageScreenRoute());
               });

          }, text: 'Allot Driver',),)
        ),
    );
  }
}
