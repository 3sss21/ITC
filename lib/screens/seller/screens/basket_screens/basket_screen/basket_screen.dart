import 'package:cashback_app/commons/icon_images.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/appCover_widget.dart';
import 'package:cashback_app/screens/seller/screens/basket_screens/basket_screen/local_widgets/buttonWithIcon_widget.dart';
import 'package:cashback_app/screens/seller/screens/basket_screens/pointsDeduction_screen/points_deduction_screen.dart';
import 'package:cashback_app/screens/seller/screens/basket_screens/scannerQRCode_screen/scannerQRCode_screen.dart';
import 'package:cashback_app/screens/seller/seller_navigation/seller_navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({Key? key}) : super(key: key);

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
          ButtonWithIconWidget(
            function: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScannerQRCodeScreen(),
              ),
            ),
            buttonTxt: 'Сканировать QR-код',
            iconWidget: ImageIcon(
              AssetImage(IconsImages.iconCamera),
              size: 25,
              color: ThemeHelper.green80,
            ),
          ),
          SizedBox(height: 32.h),
          ButtonWithIconWidget(
            function: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PointsDeductionScreen(),
              ),
            ),
            buttonTxt: 'Без приложения',
            iconWidget: Icon(
              Icons.keyboard_arrow_right_outlined,
              color: ThemeHelper.green80,
              size: 25,
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigator(currentPage: 1),
    );
  }
}
