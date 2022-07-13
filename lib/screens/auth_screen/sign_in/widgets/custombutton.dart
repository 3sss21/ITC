import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final bool isTextButton;
  final Function? onTap;

  const CustomButton({
    Key? key,
    required this.isTextButton,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24),
      width: MediaQuery.of(context).size.width * 85.07,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: ()=>  onTap != null ? onTap!() : null,
        child: isTextButton
            ? Text(
                'Войти',
                style:TextStyle(fontSize: 14, color: Colors.white),
              )
            : Text(
                'Создать',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
      ),
    );
  }
}