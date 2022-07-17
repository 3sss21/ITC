import 'package:flutter/material.dart';


class CustomSignUpTextField extends StatelessWidget {
  final TextEditingController ?mycontroller;
  final String hintText;
  const CustomSignUpTextField({
this.mycontroller,
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
      controller:mycontroller ,
        decoration: InputDecoration(
          fillColor: const Color(0xffF2F2F2),
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(
            color:Colors.grey,
            fontSize: 16
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
