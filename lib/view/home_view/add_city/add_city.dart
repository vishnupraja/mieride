import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride/rout_helper/rout_helper.dart';
import '../../../utils/colors.dart';
import '../../../utils/text_field.dart';

class AddCity extends StatefulWidget {
  const AddCity({Key? key}) : super(key: key);

  @override
  State<AddCity> createState() => _AddCityState();
}

class _AddCityState extends State<AddCity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      appBar: AppBar(
        title: Text("View City"),
        centerTitle: true,
        backgroundColor: MyColors.secondry,
      ),
      body: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          /*var list = controller.bookingList[index];*/
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Text("City Name:",style: TextStyle(
                        fontSize: 10,
                        color: MyColors.secondry,
                        fontWeight: FontWeight.bold),
                    ),),
                    SizedBox(width: 5,),
                    Center(child: Text("Bhopal",style: TextStyle(
                        fontSize: 10,
                        color: MyColors.secondry,
                        fontWeight: FontWeight.bold),)),
                  ],
                )
               ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: custom_button(
          voidCallback: () {
            Get.toNamed(RouteHelper.getAddCityFieldScreenRoute());
          },
          text: 'Add City',
        ),
      ),
    );
  }
}
