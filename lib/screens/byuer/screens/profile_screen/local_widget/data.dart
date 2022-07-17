
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileField extends StatelessWidget {
  String titleOfFIeld;
  String data;
  ProfileField({
    required this.data,
    required this.titleOfFIeld,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          titleOfFIeld,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          data,
          style: TextStyle(fontSize: 16, color: Colors.white),
        )
      ],
    );
  }
}
