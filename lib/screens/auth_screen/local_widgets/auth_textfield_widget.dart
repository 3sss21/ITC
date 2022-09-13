import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

// ignore: must_be_immutable
class AuthTextFieldWidget extends StatefulWidget {
  final String hintext;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  bool? isObsecuredText = false;
  bool? isSuffixIcon;
  bool? isClosedEye;
  final Function()? validatorFunc;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? contentPadding;

  AuthTextFieldWidget({
    Key? key,
    required this.hintext,
    required this.controller,
    this.textInputType,
    this.isObsecuredText,
    this.isSuffixIcon,
    this.isClosedEye,
    this.validatorFunc,
    this.maxLength,
    this.inputFormatters,
    this.contentPadding,
  }) : super(key: key);

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
      child: Column(
        children: [
          SizedBox(
            width: 270.w,
            height: 22.h,
            child: TextFormField(
                inputFormatters: widget.inputFormatters,
                maxLength: widget.maxLength,
                cursorColor: ThemeHelper.white,
                textInputAction: TextInputAction.next,
                keyboardType: widget.textInputType,
                style: TextStyle(
                  color: ThemeHelper.white,
                  fontWeight: FontWeight.w500,
                ),
                controller: widget.controller,
                obscureText: widget.isObsecuredText!,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  focusedBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none),
                  counterText: '',
                  counterStyle: TextStyle(color: ThemeHelper.white70),
                  contentPadding: widget.contentPadding,
                  suffix: widget.isSuffixIcon!
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
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: widget.hintext,
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: ThemeHelper.white70,
                  ),
                ),
                validator: widget.validatorFunc!()),
          ),
          Divider(color: ThemeHelper.white50)
        ],
      ),
    );
  }
}
