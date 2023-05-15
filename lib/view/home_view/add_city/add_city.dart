import 'package:flutter/material.dart';
import '../../../utils/colors.dart';

class AddCity extends StatefulWidget {
  const AddCity({Key? key}) : super(key: key);

  @override
  State<AddCity> createState() => _AddCityState();
}

class _AddCityState extends State<AddCity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      appBar: AppBar(
        title: Text("Add City"),
        centerTitle: true,
        backgroundColor: MyColors.secondry,
      ),
    );
  }
}
