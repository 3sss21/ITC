import 'package:cashback_app/commons/icon_images.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/screens/seller/screens/catalog_basket_screens/catalog_screen/local_widgets/boxCatalogProducts_widget.dart';
import 'package:cashback_app/screens/seller/screens/catalog_basket_screens/catalog_screen/local_widgets/circleButton_widget.dart';
import 'package:cashback_app/screens/seller/screens/catalog_basket_screens/scannerQRCode_screen/scannerQRCode_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CatalogProductWidget extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String productType;
  final int price;
  final int cashBack;
  const CatalogProductWidget({
    Key? key,
    required this.imageUrl,
    required this.productName,
    required this.productType,
    required this.price,
    required this.cashBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BoxCatalogProductsWidget(
          imageUrl: imageUrl,
          productName: productName,
          productType: productType,
          price: price,
          cashBack: cashBack,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleButtonWidget(
              function: () {},
              iconWidget: Icon(
                Icons.add,
                color:Color.fromRGBO(83, 42, 42, 0.8),
                size: 23,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            CircleButtonWidget(
              function: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScannerQRCodeScreen(),
                ),
              ),
              iconWidget: ImageIcon(
                AssetImage(
                  IconsImages.iconBasket,
                ),
                color: Color.fromRGBO(83, 42, 42, 0.8),
                size: 23,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
