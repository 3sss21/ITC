import 'package:cashback_app/global_widgets/feliz_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          width: 375.w,
          height: 812.h,
          child: Stack(
            children: <Widget>[
              const FelizLogoWidget(),
              Positioned(
                top: 196.h,
                left: 37.w,
                child: Container(
                  width: 300,
                  height: 420,
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
                      "Пройдите пожалуйста регистрацию",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 33.h,
                    ),
                    const RegistrationField(
                      nameOfHintext: "Адрес электронной почты",
                    ),
                    SizedBox(
                      height: 23.h,
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
                      height: 23.h,
                    ),
                    const RegistrationField(
                      nameOfHintext: "Повторите пароль",
                    ),
                  ]),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}



class RegistrationField extends StatelessWidget {
  final String nameOfHintext;
  const RegistrationField({
    Key? key,
    required this.nameOfHintext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270.w,
      height: 20.h,
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(255, 255, 255, 0.7))),
          hintText: nameOfHintext,
          hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(255, 255, 255, 0.7)),
        ),
      ),
    );
  }
}
