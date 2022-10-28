import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';

class WhiteLoadingIndicatorWidget extends StatelessWidget {
  final double? width;
  const WhiteLoadingIndicatorWidget({Key? key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width ?? 30.w,
        child: LoadingIndicator(
          indicatorType: Indicator.ballRotateChase,
          colors: [
            ThemeHelper.white50,
            ThemeHelper.white70,
            ThemeHelper.white90,
            ThemeHelper.white,
          ],
          strokeWidth: 2,
        ),
      ),
    );
  }
}
