import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride/rout_helper/rout_helper.dart';
import 'package:mie_ride/utils/colors.dart';
import 'package:mie_ride/utils/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController contactCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();

  bool visible = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyColors.primary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.primary,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Center(
              child: Container(
                height: height / 4,
                width: width / 2,
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            custom_textfield(
              labletext: "Mobile Number",
              textEditingController: contactCtr,
              textInputType: TextInputType.number,
              icons: Icon(
                Icons.email_outlined,
                color: MyColors.secondry,
              ),
            ),
            custom_textfield(
              ishide: visible,
              labletext: 'Password',
              textEditingController: passwordCtr,
              textInputType: TextInputType.text,
              icons: Icon(
                Icons.lock,
                color: MyColors.secondry,
              ),
              icon: InkWell(
                  onTap: () {
                    setState(() {
                      visible = !visible;
                    });
                  },
                  child: visible
                      ? Icon(
                          Icons.visibility_off,
                          color: MyColors.secondry,
                        )
                      : Icon(
                          Icons.visibility,
                          color: MyColors.secondry,
                        )),
            ),
            SizedBox(
              height: 50,
            ),
            custom_button(
                voidCallback: () {
                  Get.toNamed(RouteHelper.getHomePageScreenRoute());
                },
                text: "Login"),
          ],
        ),
      ),
    );
  }
}
