import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  final bool isSeller;
  const LoadingIndicatorWidget({Key? key, this.isSeller = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 60.w,
        child: LoadingIndicator(
          indicatorType: Indicator.ballRotateChase,
          colors: isSeller
              ? [
                  ThemeHelper.brown20,
                  ThemeHelper.brown50,
                  ThemeHelper.brown80,
                ]
              : [
                  ThemeHelper.green20,
                  ThemeHelper.green25,
                  ThemeHelper.green50,
                  ThemeHelper.green60,
                  ThemeHelper.green80,
                  ThemeHelper.green100
                ],
          strokeWidth: 2,
        ),
      ),
    );
  }
}
