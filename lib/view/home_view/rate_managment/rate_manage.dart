import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mie_ride/utils/colors.dart';

import '../../../rout_helper/rout_helper.dart';
import '../../../utils/text_field.dart';

class RateManagement extends StatefulWidget {
  const RateManagement({Key? key}) : super(key: key);

  @override
  State<RateManagement> createState() => _RateManagementState();
}

class _RateManagementState extends State<RateManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  MyColors.primary,
      appBar: AppBar(
        backgroundColor: MyColors.secondry,
        title: Text('Vehicle'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Vehicle Type",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: MyColors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text("SUV",
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
                                "Booking Price",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: MyColors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "150",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: MyColors.secondry,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const Text(
                                "Status",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: MyColors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text("Approved",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: MyColors.secondry,
                                      fontWeight: FontWeight.bold)),
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
                                "Tax %",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: MyColors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text("0.5",
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
                                "Admin Commission%",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: MyColors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "0.5",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: MyColors.secondry,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const Text(
                                "Available seat",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: MyColors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text("4",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: MyColors.secondry,
                                      fontWeight: FontWeight.bold)),
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
      ),
        bottomNavigationBar: Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          child: custom_button(voidCallback: () {
            Get.toNamed(RouteHelper.getAddVehicleScreenRoute());
          }, text: 'Add Vehicle',),
        ),
    );
  }
}
