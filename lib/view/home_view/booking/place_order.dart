import 'package:flutter/material.dart';
import 'package:mie_ride/controller/booking_controller.dart';
import 'package:get/get.dart';
import 'package:mie_ride/utils/text_field.dart';
import '../../../utils/colors.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({Key? key}) : super(key: key);

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  
  BookingController controller = Get.put(BookingController());
  
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.bookingManagement("Placed");
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Obx((){
      if(controller.isLoading.value){
        return Center(child: myIndicator(),);
      }else if(controller.bookingList.length == 0){
        return Center(child: Text("No Order Placed"),);
      }else{
        return ListView.builder(
          itemCount: controller.bookingList.length,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            var list = controller.bookingList[index];
            return Card(
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
                              "Booking id",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: MyColors.secondry,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text("#"+list.bookingId,
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
                              "Booking Date",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: MyColors.secondry,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(list.bookDate,
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
                              "Booking Status",
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
                              "Customer Name",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: MyColors.secondry,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(list.userName,
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
                              "Amount",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: MyColors.secondry,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(list.totalAmount,
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
                             "Destination",
                             style: TextStyle(
                                 fontSize: 12,
                                 color: MyColors.secondry,
                                 fontWeight: FontWeight.bold),
                           ),
                           SizedBox(
                             width: Get.width/2,
                             child: Text( list.destination,
                                 style: TextStyle(
                                     fontSize: 12,
                                     color: MyColors.secondry,
                                     fontWeight: FontWeight.bold)),
                           ),
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
                              child: Text( list.source,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: MyColors.secondry,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 40,
                          width: Get.width/3,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: controller.confirmLoading.value?
                                Center(child: myIndicator(),):
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MyColors.gradiant,
                                foregroundColor: MyColors.white,
                                minimumSize: Size(80, 30),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              onPressed: () {
                                controller.confirmBooking(list.bookingId, () {
                                  controller.currentIndex.value = 1;
                                });

                              },
                              child: Text(
                                "Accept",
                                style: TextStyle(fontSize: 8),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: Get.width/3,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: controller.cancelLoading.value?
                            Center(child: myIndicator(),):
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                foregroundColor: MyColors.white,
                                minimumSize: Size(80, 30),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              onPressed: () {
                                controller.cancelBooking(list.bookingId, () {
                                  controller.currentIndex.value = 4;
                                });
                              },
                              child: Text(
                                "Reject",
                                style: TextStyle(fontSize: 8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }
    },
    );
  }
}
