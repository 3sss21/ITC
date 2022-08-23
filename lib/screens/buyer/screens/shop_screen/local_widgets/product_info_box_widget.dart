import 'package:cashback_app/commons/box_shadow_helper.dart';
import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/cashed_network_image.dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductInfoBoxWidget extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String productType;
  final String price;
  final String cashBack;

  const ProductInfoBoxWidget({
    Key? key,
    required this.imageUrl,
    required this.productName,
    required this.productType,
    required this.price,
    required this.cashBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 334.w,
      height: 98.h,
      decoration: BoxDecoration(
        color: ThemeHelper.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [BoxShadowHelper.boxShadow25],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 19.w),
        child: Row(
          children: [
            CustomCachedNetworkImageWidget(
              imageUrl: imageUrl,
              width: 60.w,
              height: 60.h,
              radius: BorderRadius.circular(10.r),
            ),
            SizedBox(width: 13.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: TextStyleHelper.productNameGreen80,
                ),
                Text(
                  productType,
                  style: TextStyleHelper.f14fw500,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 120.w),
                  child: Row(
                    children: [
                      Text(
                        '$price сом/ ',
                        style: TextStyleHelper.f12fw600,
                      ),
                      Row(
                        children: [
                          Text('+ $cashBack', style: TextStyleHelper.f16w4000),
                          ImageIcon(
                            const AssetImage('assets/images/coin.png'),
                            color: ThemeHelper.yellow,
                            size: 12,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
