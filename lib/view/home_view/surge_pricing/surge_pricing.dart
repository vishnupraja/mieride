import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride/rout_helper/rout_helper.dart';
import 'package:mie_ride/utils/colors.dart';

import '../../../controller/surge_price_controller.dart';
import '../../../utils/SnackBar.dart';
import '../../../utils/text_field.dart';

class SurgePrice extends StatefulWidget {
  const SurgePrice({Key? key}) : super(key: key);

  @override
  State<SurgePrice> createState() => _SurgePriceState();
}

class _SurgePriceState extends State<SurgePrice> {

  SurgePriceController controller = Get.put(SurgePriceController());
  TextEditingController typeCtr = TextEditingController();
  TextEditingController timeCtr = TextEditingController();
  TextEditingController priceCtr = TextEditingController();

  @override
  void initState() {
    controller.fetchSurgePrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        title: Text("Surge Pricing"),
        centerTitle: true,
        toolbarHeight: 40,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)
            )
        ),
        backgroundColor: MyColors.gradiant,
      ),
      body: Obx((){
        if(controller.isLoading.value){
          return Center(child: myIndicator(),);
        }else if(controller.surgeList.length == 0){
          return Center(child: Text("No Price Added"),);
        }else{
          return ListView.builder(
            itemCount: controller.surgeList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              var list = controller.surgeList[index];
              return InkWell(
                onTap: () {},
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
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
                                  "Surge Type",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: MyColors.secondry,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(list.surgeName,
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
                                  "Surge Time",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: MyColors.secondry,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(list.surgeTime + " " + "Minute",
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
                                  "Extra price",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: MyColors.secondry,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(list.price,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: MyColors.secondry,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
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
            /*Get.toNamed(RouteHelper.getSurgePriceAddScreenRoute());*/
            _showTextInputDialog(context);
          },
          text: 'Add Surge price',
        ),
      ),
    );
  }


  Future<String?> _showTextInputDialog(
      BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Text("Surge Add",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
                SizedBox(height: 15,),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 8.0, // soften the shadow
                        spreadRadius: 2.0, //extend the shadow
                        offset: Offset(
                          0.0, // Move to right 5  horizontally
                          0.0, // Move to bottom 5 Vertically
                        ),
                      )
                    ],
                  ),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: typeCtr,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: MyColors.textFieldBack,
                        border: InputBorder.none,
                      hintText: 'Surge type'
                    ),
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 8.0, // soften the shadow
                        spreadRadius: 2.0, //extend the shadow
                        offset: Offset(
                          0.0, // Move to right 5  horizontally
                          0.0, // Move to bottom 5 Vertically
                        ),
                      )
                    ],
                  ),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: timeCtr,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: MyColors.textFieldBack,
                        border: InputBorder.none,
                      hintText: "Surge Time"
                    ),
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 8.0, // soften the shadow
                        spreadRadius: 2.0, //extend the shadow
                        offset: Offset(
                          0.0, // Move to right 5  horizontally
                          0.0, // Move to bottom 5 Vertically
                        ),
                      )
                    ],
                  ),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: priceCtr,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: MyColors.textFieldBack,
                        border: InputBorder.none,
                      hintText: "Extra Price"
                    ),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Obx(
                        () => custom_button(
                        loading: controller.isLoadings.value,
                        voidCallback: () {
                          validate();
                        },
                        text: "Submit"),
                  ))
            ],
          );
        });
  }

  Future<void> validate()async{
    if(typeCtr.text.isEmpty){
      showCustomSnackBar('Please Select Surge type',context);
    }else if(timeCtr.text.isEmpty){
      showCustomSnackBar('Please Select Surge time',context);
    }else if(priceCtr.text.isEmpty){
      showCustomSnackBar('Please Select Extra Price',context);
    }else{
      controller.surgeAddPrice(context, typeCtr.text, priceCtr.text, timeCtr.text);
    }
  }

}
