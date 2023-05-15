import 'package:flutter/material.dart';
import '../../../utils/colors.dart';


class FairCost extends StatefulWidget {
  const FairCost({Key? key}) : super(key: key);

  @override
  State<FairCost> createState() => _FairCostState();
}

class _FairCostState extends State<FairCost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      appBar: AppBar(
        title: Text("Fair Coast"),
        centerTitle: true,
        backgroundColor: MyColors.secondry,
      ),
    );
  }
}
