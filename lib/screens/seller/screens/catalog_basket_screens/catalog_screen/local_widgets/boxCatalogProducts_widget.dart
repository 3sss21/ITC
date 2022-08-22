import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/cashed_network_image.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoxCatalogProductsWidget extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String productType;
  final String price;
  final String cashBack;
  const BoxCatalogProductsWidget({
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
      width: 260.w,
      height: 98.h,
      decoration: BoxDecoration(
        color: ThemeHelper.brown80,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 18.w),
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
                SizedBox(
                  width: 150.w,
                  child: Text(
                    productName,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleHelper.productName
                        .copyWith(color: ThemeHelper.white),
                  ),
                ),
                SizedBox(
                  width: 90.w,
                  child: Text(
                    productType,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleHelper.f14fw500
                        .copyWith(color: ThemeHelper.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 7.w),
                  child: Row(
                    children: [
                      Text(
                        '$price сом/ ',
                        style: TextStyleHelper.f12fw600
                            .copyWith(color: ThemeHelper.white),
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
