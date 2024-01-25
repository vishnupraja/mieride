import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride/controller/booking_controller.dart';
import 'package:mie_ride/utils/text_field.dart';
import '../../../network/urls.dart';
import '../../../utils/colors.dart';

class CancelOrder extends StatefulWidget {
  const CancelOrder({Key? key}) : super(key: key);

  @override
  State<CancelOrder> createState() => _CancelOrderState();
}

class _CancelOrderState extends State<CancelOrder> {
  BookingController controller = Get.put(BookingController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.bookingManagement("Cancelled");
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isLoading.value) {
          return Center(
            child: myIndicator(),
          );
        } else if (controller.bookingList.length == 0) {
          return Center(
            child: Text("No Cancelled Order"),
          );
        } else {
          return ListView.builder(
            itemCount: controller.bookingList.length,
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
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
                                      color: Colors.red,
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
                                "DropOff Time",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: MyColors.secondry,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(list.bookTime,
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
                              Text(currency+" "+list.totalAmount,
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
                                "Category",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: MyColors.secondry,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(list.categoryName,
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
                                "Driver",
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
