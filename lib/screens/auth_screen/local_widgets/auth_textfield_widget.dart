import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AuthTextFieldWidget extends StatefulWidget {
  final String hintext;
  final TextEditingController? controller;
  bool? isKeyboardType = false;
  bool? isObsecuredText = false;
  bool? isSuffixIcon;
  bool? isClosedEye;

  AuthTextFieldWidget(
      {Key? key,
      required this.hintext,
      this.controller,
      this.isKeyboardType,
      this.isObsecuredText,
      this.isSuffixIcon,
      this.isClosedEye})
      : super(key: key);

  @override
  State<AuthTextFieldWidget> createState() => _AuthTextFieldWidgetState();
}

class _AuthTextFieldWidgetState extends State<AuthTextFieldWidget> {
  bool isHiddenPassword = true;
  void togglePassword() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270.w,
      height: 22.h,
      child: TextField(
        style: TextStyle(
          color: ThemeHelper.white,
          fontWeight: FontWeight.w500,
        ),
        controller: widget.controller,
        keyboardType: widget.isKeyboardType!
            ? TextInputType.number
            : TextInputType.emailAddress,
        obscureText: widget.isObsecuredText!,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 20.h, left: 40.w),
          suffixIcon: widget.isSuffixIcon!
              ? InkWell(
                  onTap: () {
                    togglePassword();
                    setState(() {
                      widget.isObsecuredText = !widget.isObsecuredText!;
                    });
                    setState(() {
                      widget.isClosedEye = !widget.isClosedEye!;
                    });
                  },
                  child: widget.isClosedEye!
                      ? Icon(
                          Icons.remove_red_eye_outlined,
                          color: ThemeHelper.white70,
                        )
                      : Icon(
                          Icons.visibility_off_outlined,
                          color: ThemeHelper.white70,
                        ),
                )
              : const SizedBox(),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ThemeHelper.white50,
            ),
          ),
          hintText: widget.hintext,
          hintStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: ThemeHelper.white70,
          ),
        ),
      ),
    );
  }
}
