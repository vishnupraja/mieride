import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride/controller/login_controller.dart';
import 'package:mie_ride/utils/SnackBar.dart';
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
  LoginController controller = Get.put(LoginController());

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
           Obx(() => custom_button(
               loading: controller.isLoading.value,
               voidCallback: () {
                 if(valid() == true){
                   controller.Login(context, contactCtr.text, passwordCtr.text);
                 }
               },
               text: "Login"), ),
          ],
        ),
      ),
    );
  }

  bool valid(){
    if(contactCtr.text.isEmpty){
      showCustomSnackBar("please fill Mobile Number", context);
    }else if(passwordCtr.text.isEmpty){
      showCustomSnackBar("please fill password", context);
    }else{
      return true;
    }
    return false;
  }

}
