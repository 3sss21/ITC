import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/global_widgets/feliz_logo_widget.dart';
import 'package:cashback_app/screens/auth_screen/local_widgets/auth_button_widget.dart';
import 'package:cashback_app/screens/auth_screen/local_widgets/auth_textfield_widget.dart';
import 'package:cashback_app/screens/auth_screen/sign_up_screen/sign_up_screen.dart';
import 'package:cashback_app/screens/byuer/buyer_navigation_widget.dart/buyer_navigation_widget.dart';
import 'package:cashback_app/screens/seller/seller_navigation/seller_navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatefulWidget {
  final bool isUser;
  const SignInScreen({Key? key, required this.isUser}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const FelizLogoWidget(),
          Positioned(
            top: 231.h,
            left: 37.w,
            right: 37.w,
            child: AuthBoxWidget(
              functionBox: 'Введите свои данные',
              listWidgets: [
                SizedBox(height: 50.h),
                const AuthTextFieldWidget(
                  hintext: "Номер телефона",
                ),
                SizedBox(height: 23.h),
                const AuthTextFieldWidget(
                  hintext: "Пароль",
                ),
                SizedBox(height: 5.h),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Забыли пароль?',
                    style: TextStyleHelper.forgotPass,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 28.h, bottom: 31.h),
                  child: AuthButtonWidget(
                    txtButton: 'ВОЙТИ',
                    function: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => widget.isUser
                            ? const BuyerNavigationWidget(currentIndex: 0)
                            : const SellerNavigationWidget(currentIndex: 0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
