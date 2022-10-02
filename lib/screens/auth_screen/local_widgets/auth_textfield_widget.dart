import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AuthTextFieldWidget extends StatefulWidget {
  final FormFieldValidator<String>? validate;

  final Key? formFieldKey;
  final String hintext;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  bool? isObsecuredText = false;
  bool? isSuffixIcon;
  bool? isClosedEye;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? contentPadding;
  final Iterable<String>? autofillHints;
  final Widget? suffixIcon;
  final String? errorText;
  final Function()? onPressed;

  AuthTextFieldWidget({
    Key? key,
    required this.hintext,
    required this.controller,
    this.textInputType,
    this.isObsecuredText,
    this.isSuffixIcon,
    this.isClosedEye,
    this.formFieldKey,
    this.validate,
    this.maxLength,
    this.inputFormatters,
    this.contentPadding,
    this.autofillHints,
    this.suffixIcon,
    this.errorText,
    this.onPressed,
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
            height: 37.h,
            child: TextFormField(
              onTap: widget.onPressed,
              key: widget.formFieldKey,
              autofillHints: widget.autofillHints,
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
              // textAlign: TextAlign.center,
              decoration: InputDecoration(
                errorStyle: const TextStyle(color: Colors.amber),
                errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                ),
                focusedErrorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ThemeHelper.white50),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ThemeHelper.white50),
                ),
                errorText: widget.errorText,
                suffixIcon: widget.suffixIcon,
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
                hintText: widget.hintext,
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: ThemeHelper.white70,
                ),
              ),
              validator: widget.validate,
            ),
          ),
        ],
      ),
    );
  }
}
