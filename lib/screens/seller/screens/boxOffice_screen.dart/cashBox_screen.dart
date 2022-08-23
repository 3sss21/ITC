import 'package:cashback_app/commons/icon_images.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/appCover_widget.dart';
import 'package:cashback_app/global_widgets/search_textfield_widget.dart';
import 'package:cashback_app/screens/seller/screens/boxOffice_screen.dart/local_widget/clients_cashBox.dart';
import 'package:cashback_app/screens/seller/screens/boxOffice_screen.dart/local_widget/phone_number.dart';
import 'package:cashback_app/screens/seller/seller_navigation/seller_navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CashBoxScreen extends StatefulWidget {
  const CashBoxScreen({Key? key}) : super(key: key);

  @override
  State<CashBoxScreen> createState() => _CashBoxScreenState();
}

class _CashBoxScreenState extends State<CashBoxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const AppCoverWidget(
            nameCover: 'КАССА',
            isSeller: true,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 22.h),
<<<<<<< HEAD
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchTextFieldWidget(
                  fillColor: ThemeHelper.brown20,
                  hintTextColor: ThemeHelper.brown80,
                  hintText: 'DD / MM/ YY',
                  suffix: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: ThemeHelper.brown80,
||||||| fa3e7f1
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchTextFieldWidget(
                  hintText: 'DD / MM/ YY',
                  
                  suffix: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Color.fromRGBO(83, 42, 42, 0.8),
=======
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchTextFieldWidget(
                    hintText: 'DD/MM/YY',
                    suffix: Image.asset(IconsImages.iconVbrown),
>>>>>>> a3ffc5629ab3b584d61a2d907e7ea154f1497465
                  ),
                  SizedBox(
                    width: 1.sw,
                    height: 550.h,
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Column(
                          children: const [
                            PhoneNumber(phoneNumber: '+996 555 55 55 55'),
                            ClientsCashBox(),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: const SellerNavigationWidget(currentIndex: 2),
    );
  }
}
