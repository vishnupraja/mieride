import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride/controller/booking_controller.dart';
import 'package:mie_ride/network/urls.dart';
import 'package:mie_ride/rout_helper/rout_helper.dart';
import 'package:mie_ride/utils/SnackBar.dart';
import 'package:mie_ride/utils/colors.dart';
import 'package:mie_ride/utils/text_field.dart';

class RideAssignment extends StatefulWidget {
  const RideAssignment({Key? key}) : super(key: key);

  @override
  State<RideAssignment> createState() => _RideAssignmentState();
}

class _RideAssignmentState extends State<RideAssignment> {
  BookingController controller = Get.put(BookingController());
  TextEditingController bonusAmount = TextEditingController();

  var idList = [];
  var driverPrice = [];

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
          return Column(
            children: [
              Flexible(
                child: ListView.builder(
                  itemCount: controller.bookingList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    var list = controller.bookingList[index];
                    return InkWell(
                      onTap: () {
                        toggleIndex(index);
                        if (idList.contains(list.bookingId) && driverPrice.contains(list.driverEarning)) {
                          driverPrice.remove(list.driverEarning);
                          idList.remove(list.bookingId);
                        } else {
                          driverPrice.add(list.driverEarning);
                          driverPrice.join(",");
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: custom_textfield(
                  textEditingController: bonusAmount,
                    textInputType:TextInputType.numberWithOptions(signed: true, decimal: true),
                    labletext: "Enter Bonus Amount",
                    hintText: "Enter Bonus Amount"),
              )
            ],
          );
        }
      }),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: custom_button(
          voidCallback: () {
            var b = 0.0, sum = 0.0;
            for(var i = 0; i < driverPrice.length; i++){
              var a = double.parse(driverPrice[i]);
               sum = a+b;
              b = sum;
            }
            print("sum-------${sum}");
            allId = idList.join(",");
            print(allId);

            if(allId == ""){
              showCustomSnackBar("please select ride", context);
            }else{
              Get.toNamed(RouteHelper.getDriverScreenRoute(),
                  arguments: {
                    "id": allId,
                    "bonus" : bonusAmount.text,
                    "totalPrice" : sum
                  });
            }
          },
          text: 'Allot Driver',
        ),
      ),
    );
  }
}

