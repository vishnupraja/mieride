import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride/controller/booking_controller.dart';
import 'package:mie_ride/utils/text_field.dart';

import '../../../utils/colors.dart';

class ConfirmOrder extends StatefulWidget {
  const ConfirmOrder({Key? key}) : super(key: key);

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {

  BookingController controller = Get.put(BookingController());
  
  @override
  void initState() {
    controller.bookingManagement("Confirmed");
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Obx((){
      if(controller.isLoading.value){
        return Center(child: myIndicator(),);
      }else if(controller.bookingList.length == 0){
        return Center(child: Text("No Confirm Order"),);
      }else{
        return ListView.builder(
          itemCount: controller.bookingList.length,
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Booking id",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: MyColors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(list.bookingId,
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
                                "Booking Date",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: MyColors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                list.bookDate,
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
                                "Booking Status",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: MyColors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(list.status,
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
                                "Customer Name",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: MyColors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(list.userName,
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
                                "Vehicle Type",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: MyColors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                list.vehicleType,
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
                                "Amount",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: MyColors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(list.totalAmount,
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
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Destination",
                            style: TextStyle(
                                fontSize: 10,
                                color: MyColors.grey,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          list.destination,
                          style: TextStyle(
                              fontSize: 10,
                              color: MyColors.secondry,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Address",
                            style: TextStyle(
                                fontSize: 10,
                                color: MyColors.grey,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          list.source,
                          style: TextStyle(
                              fontSize: 10,
                              color: MyColors.secondry,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    /* Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 30,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MyColors.orange,
                            foregroundColor: MyColors.white,
                            minimumSize: Size(80, 30),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Accept",
                            style: TextStyle(fontSize: 8),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MyColors.green,
                            foregroundColor: MyColors.white,
                            minimumSize: Size(80, 30),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Reject",
                            style: TextStyle(fontSize: 8),
                          ),
                        ),
                      ),
                    ),
                  ],
                )*/
                    /*SizedBox(
                        width: 30,
                      ),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Address",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: MyColors.grey,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'mangal nager bhawarkua indore mp',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: MyColors.secondry,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),*/
                  ],
                ),
              ),
            );
          },
        );
      }
    });
  }
}
