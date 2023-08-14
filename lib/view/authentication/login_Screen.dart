import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride/controller/login_controller.dart';
import 'package:mie_ride/utils/SnackBar.dart';
import 'package:mie_ride/utils/colors.dart';
import 'package:mie_ride/utils/text_field.dart';

import '../../rout_helper/rout_helper.dart';

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
      backgroundColor: MyColors.backgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100,),
            Center(
              child: Container(
                height: height /4,
                width: width / 2,
                child: Image.asset('assets/images/logo.png',color: MyColors.gradiant),
              ),
            ),
            Text("Login",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: MyColors.secondry),),
            custom_textfield(
              labletext: "",
              textEditingController: contactCtr,
              textInputType: TextInputType.number,
              icons: Icon(
                Icons.email_outlined,
                color: MyColors.secondry,
              ), hintText: 'Mobile Number',
            ),
            custom_textfield(
              ishide: visible,
              labletext: '',
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
                        )), hintText: 'Password',
            ),
            SizedBox(
              height: 50,
            ),
           Obx(() => Center(
             child: custom_button(
                 loading: controller.isLoading.value,
                 voidCallback: () {
                   if(valid() == true){
                     controller.Login(context, contactCtr.text, passwordCtr.text);
                   }
                 },
                 text: "Login"),
           ), ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account"),
                TextButton(onPressed: (){
                  Get.toNamed(RouteHelper.getSignUpScreenRoute());
                }, child: Text("SignUp",style: TextStyle(color: Colors.red),))
              ],
            )
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
