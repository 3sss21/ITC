import 'package:flutter/material.dart';

class CustomSignInTextField extends StatefulWidget {
  final TextEditingController? mycontroller;
  final String? hintText;
  final bool? isPrefixIcon;
  final bool? isSuffixIcon;

  const CustomSignInTextField({
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
          fillColor: const Color(0xffF2F2F2),
          filled: true,
          hintText: widget.hintText,
          hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
          prefixIcon: widget.isPrefixIcon!
              ? const Icon(
                  Icons.person_outline,
                  color: Colors.black,
                )
              : const Icon(
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
              : const SizedBox(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
