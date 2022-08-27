import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:flutter/material.dart';

class TotalCost extends StatelessWidget {
  final String totalCost;
  const TotalCost({
    Key? key, required this.totalCost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Итого", style: TextStyleHelper.f12w400);
  }
}
