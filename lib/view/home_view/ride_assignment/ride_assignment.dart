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
      backgroundColor: MyColors.primary,
      appBar: AppBar(
        backgroundColor: MyColors.secondry,
        title: Text('Ride Manage'),
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
                            Column(
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
                            SizedBox(width: 27,),
                            Column(
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
                                    fontWeight: FontWeight.bold),),
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
