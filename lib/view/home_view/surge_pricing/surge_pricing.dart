import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride/utils/colors.dart';

import '../../../controller/surge_price_controller.dart';
import '../../../utils/text_field.dart';

class SurgePrice extends StatefulWidget {
  const SurgePrice({Key? key}) : super(key: key);

  @override
  State<SurgePrice> createState() => _SurgePriceState();
}

class _SurgePriceState extends State<SurgePrice> {

  SurgePriceController controller = Get.put(SurgePriceController());

  @override
  void initState() {
    controller.fetchSurgePrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      appBar: AppBar(
        title: Text("Surge Pricing"),
        centerTitle: true,
        backgroundColor: MyColors.secondry,
      ),
      body: Obx((){
        if(controller.isLoading.value){
          return Center(child: myIndicator(),);
        }else if(controller.surgeList.length == 0){
          return Center(child: Text("No Price Added"),);
        }else{
          return ListView.builder(
            itemCount: controller.surgeList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              var list = controller.surgeList[index];
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
                                    "Surge Type",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: MyColors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(list.surgeName,
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
                                    "Surge Time",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: MyColors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    list.surgeTime,
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
                                    "Extra price",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: MyColors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(list.price,
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
          );
        }
      }),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: custom_button(
          voidCallback: () {
          },
          text: 'Add Rate',
        ),
      ),
    );
  }
}
