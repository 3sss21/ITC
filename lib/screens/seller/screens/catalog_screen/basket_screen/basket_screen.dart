import 'package:cashback_app/commons/box_shadow_helper.dart';
import 'package:cashback_app/commons/icon_images.dart';
import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/appCover_widget.dart';
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
          const AppCoverWidget(nameCover: 'КОРЗИНА'),
          Container(
            width: 320.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: ThemeHelper.white,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [BoxShadowHelper.boxShadow50],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 140.w,
                  child: Text(
                    'Сканировать QR-код',
                    textAlign: TextAlign.center,
                    style: TextStyleHelper.f14w600green80,
                  ),
                ),
                ImageIcon(
                  AssetImage(IconsImages.iconCamera),
                  size: 25,
                  color: ThemeHelper.green80,
                ),
              ],
            ),
          ),
          Container(
              width: 320.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: ThemeHelper.white,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [BoxShadowHelper.boxShadow50],
              ),
              child: ListTile(
                title: Text(
                  'Сканировать QR-код',
                  textAlign: TextAlign.center,
                  style: TextStyleHelper.f14w600green80,
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: ThemeHelper.green80,
                  size: 25,
                ),
              )
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     SizedBox(
              //       width: 140.w,
              //       child: Text(
              //         'Сканировать QR-код',
              //         style: TextStyleHelper.f14w600green80,
              //       ),
              //     ),
              //     SizedBox(width: .w,),
              //     Icon(
              //       Icons.keyboard_arrow_right_outlined,
              //       color: ThemeHelper.green80,
              //       size: 25,
              //     ),
              //   ],
              // ),
              ),
        ],
      ),
      // bottomNavigationBar: const SellerNavigationWidget(currentIndex: 2),
    );
  }
}
