import 'package:cached_network_image/cached_network_image.dart';
import 'package:cashback_app/commons/box_shadow_helper.dart';
import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/appCover_widget.dart';
import 'package:cashback_app/global_widgets/cashed_network_image.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({Key? key}) : super(key: key);

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  Box qrCode = Hive.box('userDataBox');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppCoverWidget(
            nameCover: "QR-CODE",
            isSeller: false,
          ),
          SizedBox(height: 59.h),
          Text(
            'Отсканируйте QR-code',
            style: TextStyleHelper.productNameGreen80,
          ),
          SizedBox(height: 22.h),
          Container(
            width: 334.w,
            height: 334.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: ThemeHelper.white,
              boxShadow: [BoxShadowHelper.boxShadow25],
            ),
            child: CustomCachedNetworkImageWidget(
              imageUrl: qrCode.get('qrCode'),
              height: 1.sh,
              width: 1.sw,
              radius: BorderRadius.circular(20.r),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 22.h, right: 20.w),
            child: Text(
              'Историю изменения количества баллов вы сможете просмотреть во вкладке “БАЛАНС”',
              textAlign: TextAlign.center,
              style: TextStyleHelper.productNameGreen80
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
