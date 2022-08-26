import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TxtBtnBackWidget extends StatelessWidget {
  final Function() function;
  const TxtBtnBackWidget({Key? key, required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function(),
      child: SizedBox(
        width: 73.w,
        child: Center(
          child: Row(
            children: [
              Icon(
                Icons.keyboard_arrow_left,
                color: ThemeHelper.green100,
              ),
              Text(
                "назад",
                style: TextStyleHelper.textDate,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
