import 'package:cashback_app/commons/box_shadow_helper.dart';
import 'package:cashback_app/commons/icon_images.dart';
import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryButton extends StatelessWidget {
  final String dateTimeBalance;
  final double balance;
  final int? som;
  final TextStyle? textStyleDate;
  final TextStyle? textStyleBalance;
  final Function() function;

  const HistoryButton({
    Key? key,
    required this.dateTimeBalance,
    required this.balance,
    required this.function,
    this.som,
    this.textStyleDate,
    this.textStyleBalance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function(),
      child: Container(
        width: 334.w,
        height: 61.h,
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
                child: Text(
                  dateTimeBalance,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: ThemeHelper.brown80,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '+${som} сом',
                    style: TextStyleHelper.f14w400white
                        .copyWith(color: ThemeHelper.green100),
                  ),
                  Row(
                    children: [
                      ImageIcon(
                        AssetImage(IconsImages.coin),
                        color: ThemeHelper.yellow,
                        size: 16,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        '${balance}0',
                        style: TextStyleHelper.f14w400white
                            .copyWith(color: ThemeHelper.yellow),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
