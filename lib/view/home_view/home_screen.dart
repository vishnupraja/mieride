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
    'Trip traking',
    'Add  couns',
    'Surge pricing',
    'Rate management',
    'Ride Assignment',
  ];
  List<Color> color = [Colors.orange,Colors.pink,Colors.red,Colors.green,Colors.deepOrangeAccent];

  @override
  Widget build(BuildContext context) {
    var height  = MediaQuery.of(context).size.height;
    var width  = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyColors.primary,
      appBar: AppBar(
        elevation: 0,
        title: Text("DashBoard",style: TextStyle(color: MyColors.white),),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.secondry,

      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: GridView.builder(
          itemCount: list.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
            var l = list[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                child: InkWell(
                  onTap: (){
                    if(index == 0){
                      Get.toNamed(RouteHelper.getBookingDetailScreenRoute());
                    }else if(index == 1){
                      Get.toNamed(RouteHelper.getViewUserScreenRoute());
                    }

                  },
                  child: Container(
                    width: width,
                    height: height/8,
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
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: color[index],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(child: Text(l,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: MyColors.white.withOpacity(0.7)),)),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }, ),
      ),
    );
  }
}
