import 'package:cashback_app/commons/icon_images.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/appCover_widget.dart';
import 'package:cashback_app/screens/seller/screens/catalog_basket_screens/payment_screen/payment_screen.dart';
import 'package:cashback_app/screens/seller/screens/catalog_basket_screens/pointsDeduction_screen/points_deduction_screen.dart';
import 'package:cashback_app/screens/seller/screens/catalog_basket_screens/scannerQRCode_screen/local_widgets/buttonScanner_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScannerQRCodeScreen extends StatefulWidget {
  const ScannerQRCodeScreen({Key? key}) : super(key: key);

  @override
  State<ScannerQRCodeScreen> createState() => _ScannerQRCodeScreenState();
}

class _ScannerQRCodeScreenState extends State<ScannerQRCodeScreen> {
  final qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppCoverWidget(
            nameCover: 'КОРЗИНА',
            isSeller: true,
          ),
          SizedBox(height: 220.h),
          ButtonScannerWidget(
            function: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //   ),
              // );
            },
            //  AssetImage(IconsImages.iconCamera),
            buttonTxt: 'Сканировать QR-код',
            iconWidget: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PaymentScreen()));
                },
                icon: ImageIcon(
                  AssetImage(IconsImages.iconCamera),
                  size: 25,
                  color: ThemeHelper.brown80,
                )),
          ),
          SizedBox(height: 32.h),
          ButtonScannerWidget(
            function: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PointsDeductionScreen(),
              ),
            ),
            buttonTxt: 'Без приложения',
            iconWidget: Icon(
              Icons.keyboard_arrow_right_outlined,
              color: ThemeHelper.brown80,
              size: 25,
            ),
          ),
        ],
      ),
    );

  }
}
