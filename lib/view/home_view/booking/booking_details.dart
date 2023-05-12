import 'package:flutter/material.dart';
import 'package:mie_ride/utils/colors.dart';
import 'package:mie_ride/view/home_view/booking/cancel_order.dart';
import 'package:mie_ride/view/home_view/booking/complete_order.dart';
import 'package:mie_ride/view/home_view/booking/confirm_order.dart';
import 'package:mie_ride/view/home_view/booking/order_allote.dart';

import 'place_order.dart';

class BookingDetail extends StatefulWidget {
  const BookingDetail({Key? key}) : super(key: key);

  @override
  State<BookingDetail> createState() => _BookingDetailState();
}

class _BookingDetailState extends State<BookingDetail> {

  int currentIdex = 0;
  PageController controller1 = PageController();

  @override
  void initState() {
    controller1 = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    controller1.dispose();
    super.dispose();
  }
  List<String> items=[
    'Placed',
    'Confirmed',
    'Alloted',
    'Completed',
    'Cancel'
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      appBar: AppBar(
        backgroundColor: MyColors.secondry,
        title: Text('Booking'),
          centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(data2.length,
                        (index) =>   Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 5),
                      child: SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width/4,
                        child: ElevatedButton(
                          onPressed: () {
                            controller1.animateToPage(index,duration: const Duration(microseconds: 100),
                                curve: Curves.linear);

                          },
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(5),
                              backgroundColor:currentIdex==index? MyColors.blue:MyColors.white,
                              foregroundColor: currentIdex==index? MyColors.white:MyColors.secondry,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Text(
                            items[index].toString(),
                            style:const TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ),)),
            ),

            Expanded(child:  PageView.builder(
                controller: controller1,
                onPageChanged: (int index) {
                  setState(() {
                    currentIdex = index;
                  });
                },
                itemCount: data2.length,
                physics: const ScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return data2[index];
                }),)
          ],

        ),
      ),
    );
  }
}
List data2 = [
  PlaceOrder(),
  ConfirmOrder(),
 OrderAllot(),
 CompleteOrder(),
  CancelOrder(),
];
