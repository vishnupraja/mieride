import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_ride/controller/login_controller.dart';
import 'package:mie_ride/rout_helper/rout_helper.dart';
import 'package:mie_ride/utils/SnackBar.dart';
import 'package:mie_ride/utils/colors.dart';
import 'package:mie_ride/utils/text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreen> {
  TextEditingController contactCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController nameCtr = TextEditingController();
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
            SizedBox(height: 50,),
            Center(
              child: Container(
                height: height /5,
                width: width / 2,
                child: Image.asset('assets/images/logo.png',color: MyColors.gradiant),
              ),
            ),
            Text("SignUp",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: MyColors.secondry),),
            custom_textfield(
              labletext: "",
              textEditingController: nameCtr,
              textInputType: TextInputType.text,
              icons: Icon(
                Icons.person,
                color: MyColors.secondry,
              ), hintText: ' Full Name',
            ),
            custom_textfield(
              labletext: "",
              textEditingController: emailCtr,
              textInputType: TextInputType.text,
              icons: Icon(
                Icons.email_outlined,
                color: MyColors.secondry,
              ), hintText: 'Email Address',
            ),

            custom_textfield(
              labletext: "",
              textEditingController: contactCtr,
              textInputType: TextInputType.number,
              icons: Icon(
                Icons.phone_android_sharp,
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
             Center(
              child: custom_button(
                  voidCallback: () {
                    if(valid()== true){
                      dialogueBox();
                    }
                  },
                  text: "SignUp"),
            ),
          ],
        ),
      ),
    );
  }

  bool valid(){
    if(nameCtr.text.isEmpty){
      showCustomSnackBar("please fill Name", context);
    }else if(emailCtr.text.isEmpty){
      showCustomSnackBar("please fill Email", context);
    }else if(contactCtr.text.isEmpty){
      showCustomSnackBar("please fill Mobile Number", context);
    }else if(passwordCtr.text.isEmpty){
      showCustomSnackBar("please fill Password", context);
    }else{
      return true;
    }
    return false;
  }


  void dialogueBox() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      pageBuilder: (context, anim1, anim2) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height /3,
              width: MediaQuery.of(context).size.width,
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
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                "Registered Successfully",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 50),
                              child: custom_button(
                                  voidCallback: () {
                                    setState(() {
                                     Get.offNamed(RouteHelper.getLoginScreenRoute());
                                    });
                                  },
                                  text: "Login"),
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
