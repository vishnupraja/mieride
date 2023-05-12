import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class CompleteOrder extends StatefulWidget {
  const CompleteOrder({Key? key}) : super(key: key);

  @override
  State<CompleteOrder> createState() => _CompleteOrderState();
}

class _CompleteOrderState extends State<CompleteOrder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Card(
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
                          Text("pending",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: MyColors.secondry,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
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
                SizedBox(height: 10,),
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
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 30,
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            MyColors.orange,

                            foregroundColor: MyColors.white,
                            minimumSize: Size(80, 30),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(10)),
                          ),
                          onPressed: () {
                          },
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
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            MyColors.green,

                            foregroundColor: MyColors.white,
                            minimumSize: Size(80, 30),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(10)),
                          ),
                          onPressed: () {
                          },
                          child: Text(
                            "Reject",
                            style: TextStyle(fontSize: 8),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
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
      },);
  }
}
