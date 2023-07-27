import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride/controller/booking_controller.dart';
import 'package:mie_ride/rout_helper/rout_helper.dart';
import 'package:mie_ride/utils/colors.dart';
import 'package:mie_ride/utils/text_field.dart';

class RideAssignment extends StatefulWidget {
  const RideAssignment({Key? key}) : super(key: key);

  @override
  State<RideAssignment> createState() => _RideAssignmentState();
}

class _RideAssignmentState extends State<RideAssignment> {
  BookingController controller = Get.put(BookingController());

  var idList = [];
  String allId = "";
  bool selected = false;
  List<int> selectedIndexes = [];

  void toggleIndex(int i) {
    if (selectedIndexes.contains(i)) {
      print(selectedIndexes);
      setState(() => selectedIndexes.remove(i));
    } else
      setState(() => selectedIndexes.add(i));
    if (selectedIndexes.length > 0)
      setState(() => selected = true);
    else
      setState(() => selected = false);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.bookingManagement("Confirmed");
    });
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
        title: Text('Ride Assignment'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: myIndicator(),
          );
        } else if (controller.bookingList.length == 0) {
          return Center(
            child: Text("No Ride Available"),
          );
        } else {
          return ListView.builder(
            itemCount: controller.bookingList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              var list = controller.bookingList[index];
              return InkWell(
                onTap: () {
                  toggleIndex(index);
                  if (idList.contains(list.bookingId)) {
                    idList.remove(list.bookingId);
                  } else {
                    idList.add(list.bookingId);
                    idList.join(",");

                  }
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
                        Align(
                          alignment: Alignment.bottomRight,
                          child: selected && selectedIndexes.contains(index)
                              ? Icon(
                            Icons.check_circle,
                            color: MyColors.green,
                          )
                              : null,
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
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: custom_button(
          voidCallback: () {
            allId = idList.join(",");
            print(allId);
            Get.toNamed(RouteHelper.getDriverScreenRoute(),
                arguments: {"id": allId});
          },
          text: 'Allot Driver',
        ),
      ),
    );
  }
}

