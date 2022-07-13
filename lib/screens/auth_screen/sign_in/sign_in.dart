import 'package:cashback_app/screens/auth_screen/sign_up/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Logo(),
          Positioned(
            top: 196.h,
            left: 37.w,
            child: Container(
              width: 300,
              height: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(23, 69, 59, 0.8)),
              child: Column(children: [
                SizedBox(
                  height: 50.h,
                ),
                const Text(
                  "Добро пожаловать в cashback-сервис FELIZ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 29.h,
                ),
                const Text(
                  "Введите свои данные",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Lato",
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                const RegistrationField(
                  nameOfHintext: "Номер телефона",
                ),
                SizedBox(
                  height: 23.h,
                ),
                const RegistrationField(
                  nameOfHintext: "Пароль",
                ),
                SizedBox(
                  height: 20.h,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0, 
                      primary: Color.fromRGBO(23, 69, 59, 0.8)),
                  onPressed: () {},
                  child: const Text(
                    "Забыли пароль?",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(255, 255, 255, 0.5)),
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
