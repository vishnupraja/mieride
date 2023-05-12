import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride/rout_helper/rout_helper.dart';
import 'package:mie_ride/utils/colors.dart';
import 'package:mie_ride/utils/text_field.dart';

class RideAssignment extends StatefulWidget {
  const RideAssignment({Key? key}) : super(key: key);

  @override
  State<RideAssignment> createState() => _RideAssignmentState();
}

class _RideAssignmentState extends State<RideAssignment> {

  bool selected = false;
  List<int> id = [];
  List<int> selectedIndexes = [];
  void toggleIndex(int i) {
    if (selectedIndexes.contains(i)){
      print(selectedIndexes);
      setState(() => selectedIndexes.remove(i));
    }
    else
      setState(() => selectedIndexes.add(i));
    if (selectedIndexes.length > 0)
      setState(() => selected = true);
    else
      setState(() => selected = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      appBar: AppBar(
        backgroundColor: MyColors.secondry,
        title: Text('Ride'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              toggleIndex(index);
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
                                "Booking id",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: MyColors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text("12",
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
                                "30/12/2024",
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
                              Text("Confirm",
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
                              Text("Raju",
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
                                "Four Wiler",
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
                              Text("\$400",
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
                          "mangal nager bhawar kua squre near rajiv gandhi sai ram plaza indere mp",
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
                          'mangal nager bhawar kua squre near rajiv gandhi sai ram plaza indere mp',
                          style: TextStyle(
                              fontSize: 10,
                              color: MyColors.secondry,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: selected && selectedIndexes.contains(index)?Icon(Icons.check_circle,color: MyColors.green,):null,
                  )
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      child: custom_button(voidCallback: () {
        print(selectedIndexes);
        Get.toNamed(RouteHelper.getDriverScreenRoute());
      }, text: 'Allot Driver',),
      ),
    );
  }
}
