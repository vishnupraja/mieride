import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride/controller/coin_controller.dart';
import 'package:mie_ride/utils/colors.dart';
import 'package:mie_ride/utils/text_field.dart';

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
        backgroundColor: MyColors.primary,
        appBar: AppBar(
          title: Text("ViewUser"),
          centerTitle: true,
          backgroundColor: MyColors.secondry,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Name",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(list.userName,
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: MyColors.secondry,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Email",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  list.email,
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: MyColors.secondry,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Wallet Balance",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: MyColors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text("\$${list.walletBalance}",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: MyColors.secondry,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: MyColors.orange,
                                    foregroundColor: MyColors.white,
                                    minimumSize: Size(80, 30),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  onPressed: () {
                                    _showTextInputDialog(context, list.userId,
                                        list.walletBalance);
                                  },
                                  child: Text(
                                    "Add Coin",
                                    style: TextStyle(fontSize: 8),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
                Row(
                  children: [
                    const Text('Total Credit:- '),
                    Text('USD.$price}'),
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
              child: TextField(
                keyboardType: TextInputType.number,
                controller: coinController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColors.secondry))),
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
