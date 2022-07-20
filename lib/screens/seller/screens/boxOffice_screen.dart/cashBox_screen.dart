import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/appCover_widget.dart';
import 'package:cashback_app/global_widgets/search_textfield_widget.dart';
import 'package:cashback_app/screens/seller/screens/boxOffice_screen.dart/local_widget/clients_cashBox.dart';
import 'package:cashback_app/screens/seller/screens/boxOffice_screen.dart/local_widget/phone_number.dart';
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
      body: Column(
        children: [
          const AppCoverWidget(nameCover: 'КАССА'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 22.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchTextFieldWidget(
                  hintText: 'DD / MM/ YY',
                  suffix: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: ThemeHelper.green80,
                  ),
                ),
                const PhoneNumber(phoneNumber: '+996 555 55 55 55'),
                const ClientsCashBox(),
                const PhoneNumber(phoneNumber: '+996 777 77 77 77'),
                const ClientsCashBox(),
                const PhoneNumber(phoneNumber: 'Client'),
                const ClientsCashBox(),
              ],
            ),
          ),
        ],
      ),
      // bottomNavigationBar: const SellerNavigationWidget(currentIndex: 3),
    );
  }
}
