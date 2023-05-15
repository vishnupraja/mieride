import 'package:flutter/material.dart';
import 'package:mie_ride/utils/colors.dart';

class SurgePrice extends StatefulWidget {
  const SurgePrice({Key? key}) : super(key: key);

  @override
  State<SurgePrice> createState() => _SurgePriceState();
}

class _SurgePriceState extends State<SurgePrice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      appBar: AppBar(
        title: Text("Surge Pricing"),
        centerTitle: true,
        backgroundColor: MyColors.secondry,
      ),
    );
  }
}
