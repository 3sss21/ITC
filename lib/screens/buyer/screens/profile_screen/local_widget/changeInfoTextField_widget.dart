import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

class ChangeInfoTextFieldWidget extends StatefulWidget {
  final double width;
  final String valueTextField;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool isObscureText;
  final String? value;

  const ChangeInfoTextFieldWidget({
    Key? key,
    required this.width,
    required this.valueTextField,
    this.controller,
    this.keyboardType,
    this.isObscureText = false,
    this.value,
  }) : super(key: key);

  @override
  State<ChangeInfoTextFieldWidget> createState() =>
      _ChangeInfoTextFieldWidgetState();
}

class _ChangeInfoTextFieldWidgetState extends State<ChangeInfoTextFieldWidget> {
  @override
  void initState() {
    widget.controller?.text = widget.value ?? 'unknown';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${widget.valueTextField}:',
          style: TextStyleHelper.productNameGreen80.copyWith(
            color: ThemeHelper.white,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Container(
            width: widget.width.w,
            height: 16.h,
            decoration: BoxDecoration(
              border: RDottedLineBorder(
                bottom: BorderSide(color: ThemeHelper.white),
              ),
            ),
            child: TextFormField(
              controller: widget.controller,
              style: TextStyleHelper.f14w600,
              cursorColor: ThemeHelper.white70,
              obscureText: widget.isObscureText,
              keyboardType: widget.keyboardType,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
