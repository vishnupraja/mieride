import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride/utils/colors.dart';
import 'package:mie_ride/utils/text_field.dart';

class ViewUser extends StatefulWidget {
  const ViewUser({Key? key}) : super(key: key);

  @override
  State<ViewUser> createState() => _ViewUserState();
}

class _ViewUserState extends State<ViewUser> {
  TextEditingController coinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      appBar: AppBar(
        title: Text("ViewUser"),
        centerTitle: true,
        backgroundColor: MyColors.secondry,
      ),
      body: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                          Text("Human",
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
                            "human@gmail.com",
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
                          Text("\$300",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: MyColors.secondry,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: MyColors.orange,
                              foregroundColor: MyColors.white,
                              minimumSize: Size(80, 30),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            onPressed: () {
                              _showTextInputDialog(context);
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
      ),
    );
  }

  Future<String?> _showTextInputDialog(BuildContext context) async {
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
                    const Text('USD.350'),
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
                child: custom_button(
                    voidCallback: () {
                      Get.back();
                    },
                    text: "Add Credit"),
              )
            ],
          );
        });
  }
}
