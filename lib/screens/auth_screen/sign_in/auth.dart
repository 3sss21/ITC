import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 37, right: 38),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 120.h,
              ),
              SizedBox(
                width: 150.w,
                height: 150.h,
                child: Image.asset("assets/images/Vector.png"),
              ),
              SizedBox(height: 70.h),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porta commodo nisi nec molestie.",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              SizedBox(
                height: 36.h,
              ),
              AuthButton(
                nameOfButton: "ВХОД",
              ),
              SizedBox(
                height: 36.h,
              ),
              AuthButton(
                nameOfButton: "ЗАРЕГИСТРИРОВАТЬСЯ",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthButton extends StatelessWidget {
  final String nameOfButton;
  const AuthButton({
    Key? key,
    required this.nameOfButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.green[800],
          minimumSize: Size(300.w, 50.h),
          maximumSize: Size(300.w, 50.h),
          shadowColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          
          ),
        ),
        onPressed: () {},
        child: Text(
          nameOfButton,
          style: const TextStyle(
            
            fontSize: 22,
            fontWeight: FontWeight.w700,
            fontFamily: "Lato",
            color: Colors.white,
          ),
        ));
  }
}
