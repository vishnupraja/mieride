import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride/controller/login_controller.dart';
import 'package:mie_ride/rout_helper/rout_helper.dart';
import 'package:mie_ride/utils/colors.dart';
import 'package:mie_ride/utils/shared_preferences.dart';
import 'package:mie_ride/view/authentication/login_Screen.dart';

import '../../utils/text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  SharedPreferenceMie sp = SharedPreferenceMie();
  LoginController controller = Get.put(LoginController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        toolbarHeight: 35,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)
            )
        ),
        title: Text(
          "DashBoard",
          style: TextStyle(color: MyColors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.gradiant,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
                onTap: () {
                  sp.clearData();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Icon(Icons.logout)),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
                onTap: () {
                  dialogueBox();
                },
                child: Icon(Icons.delete)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(RouteHelper.getBookingDetailScreenRoute());
                },
                child: Row(
                  children: [
                    Container(
                      height: Get.height / 6,
                      width: Get.width / 3,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [MyColors.gradiant, MyColors.gradiant2],
                          ),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(60)
                          )
                      ),
                      child: Center(
                        child: Container(
                          height: Get.height / 9,
                          width: Get.width / 4,
                          decoration: BoxDecoration(
                            color: MyColors.white,
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/images/booking_management.png",
                              height: 80,),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width / 2,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20,
                              horizontal: 10),
                          child: Center(
                            child: Text("Booking Managements", style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: () {
                  Get.toNamed(RouteHelper.getViewUserScreenRoute());
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: Get.width / 2,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20,
                              horizontal: 10),
                          child: Center(
                            child: Text("Add Coins", style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: Get.height / 6,
                      width: Get.width / 3,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [MyColors.gradiant, MyColors.gradiant2],
                          ),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(60)
                          )
                      ),
                      child: Center(
                        child: Container(
                          height: Get.height / 9,
                          width: Get.width / 4,
                          decoration: BoxDecoration(
                            color: MyColors.white,
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/images/Coin.png", height: 80,),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: () {
                  Get.toNamed(RouteHelper.getRateManagementScreenRoute());
                },
                child: Row(
                  children: [
                    Container(
                      height: Get.height / 6,
                      width: Get.width / 3,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [MyColors.gradiant, MyColors.gradiant2],
                          ),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(60)
                          )
                      ),
                      child: Center(
                        child: Container(
                          height: Get.height / 9,
                          width: Get.width / 4,
                          decoration: BoxDecoration(
                            color: MyColors.white,
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/images/rate.png", height: 80,),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width / 2,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20,
                              horizontal: 10),
                          child: Center(
                            child: Text("Rate Management", style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: () {
                  Get.toNamed(RouteHelper.getRideAssignmentScreenRoute());
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: Get.width / 2,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20,
                              horizontal: 10),
                          child: Center(
                            child: Text("Ride Assignment ", style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: Get.height / 6,
                      width: Get.width / 3,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [MyColors.gradiant, MyColors.gradiant2],
                          ),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(60)
                          )
                      ),
                      child: Center(
                        child: Container(
                          height: Get.height / 9,
                          width: Get.width / 4,
                          decoration: BoxDecoration(
                            color: MyColors.white,
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/images/ride.png", height: 70,),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: () {
                  Get.toNamed(RouteHelper.getAddCityScreenRoute());
                },
                child: Row(
                  children: [
                    Container(
                      height: Get.height / 6,
                      width: Get.width / 3,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [MyColors.gradiant, MyColors.gradiant2],
                          ),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(60)
                          )
                      ),
                      child: Center(
                        child: Container(
                          height: Get.height / 9,
                          width: Get.width / 4,
                          decoration: BoxDecoration(
                            color: MyColors.white,
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/images/AddCity.png", height: 70,),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width / 2,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20,
                              horizontal: 10),
                          child: Center(
                            child: Text("Add City", style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: () {
                  Get.toNamed(RouteHelper.getSurgePriceScreenRoute());
                },
                child: Row(
                  children: [

                    SizedBox(
                      width: Get.width / 2,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20,
                              horizontal: 10),
                          child: Center(
                            child: Text("Super Pricing", style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: Get.height / 6,
                      width: Get.width / 3,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [MyColors.gradiant, MyColors.gradiant2],
                          ),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(60)
                          )
                      ),
                      child: Center(
                        child: Container(
                          height: Get.height / 9,
                          width: Get.width / 4,
                          decoration: BoxDecoration(
                            color: MyColors.white,
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/images/superPricing.png", height: 80,),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /*GridView.builder(
                itemCount: list.length,
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context, index) {
                  var l = list[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                        }*/ /*else if(index == 6){
                          Get.toNamed(RouteHelper.getFairCostScreenRoute());
                        }*/ /*
                      },
                      child: Container(
                        width: width,
                        height: height / 8,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 12.0, // soften the shadow
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
              ),*/
            ],
          ),
        ),
      ),
    );
  }

  void dialogueBox() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations
          .of(context)
          .modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      pageBuilder: (context, anim1, anim2) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 3,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                child: StatefulBuilder(
                  builder: (context, setState) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color(0xff0FB970), width: 4.0),
                                    borderRadius: BorderRadius.circular(60)),
                                child: Center(
                                  child: Icon(
                                    Icons.check,
                                    color: Color(0xff0FB970),
                                    size: 50,
                                    weight: 20,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Text(
                                "Do you want delete your account",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 50),
                              child: Obx(() {
                                if(controller.deleteLoading.value){
                                 return Center(
                                    child: myIndicator(),
                                  );
                                }else{
                                  return custom_button(
                                      voidCallback: () {
                                        setState(() {
                                          controller.deleteAccount(context);
                                        });
                                      },
                                      text: "Delete");
                                }

                              }),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

}
