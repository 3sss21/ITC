import 'package:cashback_app/global_widgets/appCover_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({Key? key}) : super(key: key);

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppCoverWidget(nameCover: "qr-code"),
          SizedBox(height: 59.h,),
          const Text(
            'Отсканируйте QR-code',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          SizedBox(height: 22.h),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromRGBO(255, 255, 255, 1),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(23, 69, 59, 0.25),
                  offset: Offset(0.9, 0.9),
                  blurRadius: 0.9,
                  spreadRadius: 0.9,
                ),
              ],
            ),
            child: Image.asset(
              'assets/images/Group.png',
              width: 334.w,
              height: 334.h,
            ),
          ),
          SizedBox(height: 22.h,),
         const Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
                'Историю изменения количества баллов вы сможете просмотреть во вкладке “БАЛАНС”',
               textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
