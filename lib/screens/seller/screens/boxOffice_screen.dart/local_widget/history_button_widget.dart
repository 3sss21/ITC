import 'package:cashback_app/commons/box_shadow_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryButton extends StatelessWidget {
  final String dateTimeBalance;
  final double balance;
  final Function() function;
  final TextStyle textStyleDate;
  final TextStyle textStyleBalance;

  const HistoryButton({
    Key? key,
    required this.dateTimeBalance,
    required this.balance,
    required this.function,
    required this.textStyleDate,
    required this.textStyleBalance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function(),
      child: Container(
        width: 334.w,
        height: 40.h,
        decoration: BoxDecoration(
            color: ThemeHelper.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [BoxShadowHelper.boxShadow50]),
        child: Padding(
          padding: EdgeInsets.only(left: 33.w, right: 18.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 160.w,
                child: Text(dateTimeBalance, style: textStyleDate),
              ),
              Text('+${balance}0', style: textStyleBalance),
            ],
          ),
        ),
      ),
    );
  }
}
