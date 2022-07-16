import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/cashed_network_image.dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductInfoBoxWidget extends StatelessWidget {
  const ProductInfoBoxWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 334.w,
      height: 98.h,
      decoration: BoxDecoration(
        color: ThemeHelper.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: ThemeHelper.green25,
            offset: const Offset(0, 4),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 19.w),
        child: Row(
          children: [
            CustomCachedNetworkImageWidget(
              imageUrl:
                  'https://www.flashnord.com/sites/default/files/uploads/main/kofe_2.jpg',
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
                  'ICE Tea (зеленый)',
                  style: TextStyle(
                    color: const Color.fromRGBO(23, 69, 59, 0.8),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Напитки',
                  style: TextStyle(
                    color: const Color.fromRGBO(23, 69, 59, 0.6),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 147.w),
                  child: Row(
                    children: [
                      Text(
                        '90 сом/ ',
                        style: TextStyle(
                          color: const Color.fromRGBO(23, 69, 59, 0.8),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '+ 0',
                            style: TextStyle(
                              color: Color(0xffFFD600),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          ImageIcon(
                            AssetImage('assets/images/coin.png'),
                            color: Color(0xffFFD600),
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
