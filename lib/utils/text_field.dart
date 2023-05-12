import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'colors.dart';

class custom_textfield extends StatelessWidget {
  String labletext;
  Widget? icon;
  Widget? icons;
  final bool ishide;
  TextInputType? textInputType;
  TextEditingController? textEditingController;

  custom_textfield({
    super.key,
    required this.labletext,
    this.icon,
    this.icons,
    this.textInputType,
    this.textEditingController,
    this.ishide = false
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
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
                border: Border.all(color: MyColors.secondry, width: 1)),
            child: TextFormField(
              controller: textEditingController,
              obscureText: ishide,
              keyboardType: textInputType,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: labletext,
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
      width: context.width/1.5,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.secondry,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topRight: Radius.circular(10)),
          ),
        ),
        onPressed: voidCallback,
        child: loading ? myIndicator() : Text(text),
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
