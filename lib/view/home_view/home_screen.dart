import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride/rout_helper/rout_helper.dart';
import 'package:mie_ride/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List list = [
    'Booking Managements',
    'Add coins',
    'Rate management',
    'Ride Assignment',
    'Add City',
    'Surge pricing',
   /* 'Fair Cost'*/
  ];
  List<Color> color = [
    Colors.orange,
    Colors.pink,
    Colors.red,
    Colors.deepOrangeAccent,
    Colors.green,
    Colors.redAccent,
    /*Colors.deepOrangeAccent*/
  ];
  List<Image> image = [
    Image(
      image: AssetImage("assets/images/booking_management.png"),
      width: Get.width / 2,
      fit: BoxFit.fill,
      height: Get.height / 6.5,
    ),
    Image(
        image: AssetImage("assets/images/Coin.png"),
        width: Get.width / 2,
        fit: BoxFit.fill,
        height: Get.height / 6.5),
    Image(
        image: AssetImage("assets/images/price.png"),
        width: Get.width / 2,
        fit: BoxFit.fill,
        height: Get.height / 6.5),
    Image(
        image: AssetImage("assets/images/ride.png"),
        width: Get.width / 2,
        fit: BoxFit.fill,
        height: Get.height / 6.5),
    Image(
        image: AssetImage("assets/images/AddCity.png"),
        width: Get.width / 2,
        fit: BoxFit.fill,
        height: Get.height / 6.5),
     Image(
        image: AssetImage("assets/images/rate.png"),
        width: Get.width / 2,
        fit: BoxFit.fill,
        height: Get.height / 6.5),
    /*Image(
        image: AssetImage("assets/images/FairCost.png"),
        width: Get.width / 2,
        fit: BoxFit.fill,
        height: Get.height / 6.5),*/
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyColors.primary,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "DashBoard",
          style: TextStyle(color: MyColors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.secondry,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: GridView.builder(
          itemCount: list.length,
          shrinkWrap: true,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            var l = list[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: InkWell(
                onTap: () {
                  if (index == 0) {
                    Get.toNamed(RouteHelper.getBookingDetailScreenRoute());
                  } else if (index == 1) {
                    Get.toNamed(RouteHelper.getViewUserScreenRoute());
                  }else if(index == 3){
                    Get.toNamed(RouteHelper.getRideAssignmentScreenRoute());
                  }else if(index == 2){
                    Get.toNamed(RouteHelper.getRateManagementScreenRoute());
                  }else if(index == 4){
                    Get.toNamed(RouteHelper.getAddCityScreenRoute());
                  }else if(index == 5){
                    Get.toNamed(RouteHelper.getSurgePriceScreenRoute());
                  }/*else if(index == 6){
                    Get.toNamed(RouteHelper.getFairCostScreenRoute());
                  }*/
                },
                child: Container(
                  width: width,
                  height: height / 8,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 15.0, // soften the shadow
                        spreadRadius: 2.0, //extend the shadow
                        offset: Offset(
                          5.0, // Move to right 5  horizontally
                          5.0, // Move to bottom 5 Vertically
                        ),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: color[index],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(70),
                              child: image[index]),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Text(
                            l,
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: MyColors.white.withOpacity(0.7)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
