import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride/controller/coin_controller.dart';
import 'package:mie_ride/utils/colors.dart';
import 'package:mie_ride/utils/text_field.dart';

import '../../../network/urls.dart';

class ViewUser extends StatefulWidget {
  const ViewUser({Key? key}) : super(key: key);

  @override
  State<ViewUser> createState() => _ViewUserState();
}

class _ViewUserState extends State<ViewUser> {
  TextEditingController coinController = TextEditingController();
  CoinController controller = Get.put(CoinController());

  @override
  void initState() {
    controller.userFetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.backgroundColor,
        appBar: AppBar(
          title: Text("AddCoin"),
          toolbarHeight: 40,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)
              )
          ),
          centerTitle: true,
          backgroundColor: MyColors.gradiant,
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return Center(
              child: myIndicator(),
            );
          } else if (controller.userList.length == 0) {
            return Center(
              child: Text('Empty User'),
            );
          } else {
            return ListView.builder(
              itemCount: controller.userList.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                var list = controller.userList[index];
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
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
                                  "Name",
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
                                  "Email",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: MyColors.secondry,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(list.email,
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
                                  "Wallet Balance",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: MyColors.secondry,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(currency +" "+list.walletBalance,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: MyColors.secondry,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Center(
                          child: SizedBox(
                            height: 40,
                            width: Get.width/3,
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 10),
                              child: custom_button(voidCallback: () {
                                _showTextInputDialog(context, list.userId,
                                    list.walletBalance);
                              }, text: 'Add Coins',)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        }));
  }

  Future<String?> _showTextInputDialog(
      BuildContext context, String id, String price) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/coinPopImage.png'),
                Row(
                  children: [
                    const Text('Total Credit:- ',style: TextStyle(fontSize: 20),),
                    Flexible(child: Text('CAD $price',style: TextStyle(fontSize: 20),)),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Credit",
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
            content: Container(
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
                keyboardType: TextInputType.number,
                controller: coinController,

                decoration: const InputDecoration(
                  filled: true,
                    fillColor: MyColors.textFieldBack,
                  border: InputBorder.none
                   ),
              ),
            ),
            actions: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Obx(
                    () => custom_button(
                        loading: controller.coinLoading.value,
                        voidCallback: () {
                          controller.addCoin(context, id, coinController.text);
                          coinController.text = "";
                        },
                        text: "Add Credit"),
                  ))
            ],
          );
        });
  }
}
