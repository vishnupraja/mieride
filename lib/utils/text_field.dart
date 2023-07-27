import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'colors.dart';

class custom_textfield extends StatelessWidget {
  String labletext;
  String hintText;
  Widget? icon;
  Widget? icons;
  final bool ishide;
  TextInputType? textInputType;
  TextEditingController? textEditingController;

  custom_textfield(
      {super.key,
      required this.labletext,
        required this.hintText,
      this.icon,
      this.icons,
      this.textInputType,
      this.textEditingController,
      this.ishide = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        children: [
          Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(labletext)),
          Container(
            height: 50,
            width: context.width,
            padding: const EdgeInsets.only(left: 10),
            margin: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
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
                color: MyColors.white,
                border: Border.all(color: MyColors.white,)),
            child: TextFormField(
              controller: textEditingController,
              obscureText: ishide,
              keyboardType: textInputType,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: hintText,
                  suffixIcon: icon,
                  prefixIcon: icons,
                  hintStyle:
                      const TextStyle(color: MyColors.hintColor, fontSize: 15)),
            ),
          )
        ],
      ),
    );
  }
}

class custom_button extends StatelessWidget {
  VoidCallback voidCallback;
  String text;
  final bool loading;

  custom_button(
      {super.key,
      required this.voidCallback,
      required this.text,
      this.loading = false})
      : super();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: context.width / 1.5,
      child: InkWell(
        onTap: voidCallback,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [MyColors.gradiant, MyColors.gradiant2],
            ),
          ),
            child: Center(
              child: loading ? myIndicator() : Text(text),
            )
        ),
      ),
    );
  }
}

Widget myIndicator() {
  return CircularProgressIndicator(
    color: MyColors.primary,
    strokeWidth: 2,
    backgroundColor: Colors.blue[200],
  );
}
