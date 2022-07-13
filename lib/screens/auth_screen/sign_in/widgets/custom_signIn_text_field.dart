import 'package:flutter/material.dart';

class CustomSignInTextField extends StatefulWidget {
  final TextEditingController? mycontroller;
  final String? hintText;
  final bool? isPrefixIcon;
  final bool? isSuffixIcon;

  CustomSignInTextField({
    Key? key,
    this.mycontroller,
    this.hintText,
    this.isPrefixIcon = false,
    this.isSuffixIcon,
  }) : super(key: key);

  @override
  State<CustomSignInTextField> createState() => _CustomSignInTextFieldState();
}

class _CustomSignInTextFieldState extends State<CustomSignInTextField> {
  bool isHiddenPassword = true;

  void togglePassword() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: widget.mycontroller,
        obscureText: isHiddenPassword,
        decoration: InputDecoration(
          fillColor: Color(0xffF2F2F2),
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
          prefixIcon: widget.isPrefixIcon!
              ? Icon(
                  Icons.person_outline,
                  color: Colors.black,
                )
              : Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
          suffixIcon: widget.isSuffixIcon!
              ? InkWell(
                  onTap: () {
                    togglePassword();
                  },
                  child: Icon(Icons.visibility),
                )
              : SizedBox(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
