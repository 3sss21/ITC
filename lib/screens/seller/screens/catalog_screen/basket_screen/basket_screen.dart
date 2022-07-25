import 'package:cashback_app/commons/icon_images.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/appCover_widget.dart';
import 'package:cashback_app/screens/seller/screens/catalog_screen/basket_screen/local_widgets/buttonScanner_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppCoverWidget(nameCover: 'КОРЗИНА'),
          SizedBox(height: 220.h),
          ButtonScannerWidget(
            function: () {},
            buttonTxt: 'Сканировать QR-код',
            iconWidget: ImageIcon(
              AssetImage(IconsImages.iconCamera),
              size: 25,
              color: ThemeHelper.green80,
            ),
          ),
          SizedBox(height: 32.h),
          ButtonScannerWidget(
            function: () {},
            buttonTxt: 'Без приложения',
            iconWidget: Icon(
              Icons.keyboard_arrow_right_outlined,
              color: ThemeHelper.green80,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
