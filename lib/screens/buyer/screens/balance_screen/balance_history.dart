import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoxPurchaseHistoryWidget extends StatelessWidget {
  final String datePurchase;
  final String nameProduct;
  final double priceProduct;
  final Function() function;
  const BoxPurchaseHistoryWidget({
    Key? key,
    required this.datePurchase,
    required this.nameProduct,
    required this.priceProduct,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, top: 75.h, right: 20.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => function(),
                child: Row(
                  children: [
                    Icon(
                      Icons.keyboard_arrow_left,
                      color: ThemeHelper.green100,
                    ),
                    Text(
                      "назад",
                      style: TextStyleHelper.textDate,
                    ),
                  ],
                ),
              ),
              Text(
                datePurchase,
                style: TextStyleHelper.productName,
              ),
            ],
          ),
          Container(
            width: 334.w,
            decoration: BoxDecoration(
              color: ThemeHelper.green80,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 31.h),
              child: Column(
                children: [
                  SizedBox(
                    width: 1.sw,
                    height: 260.h,
                    child: ListView.separated(
                      itemBuilder: (context, index) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 160.w,
                            height: 16.h,
                            child: Text(
                              nameProduct,
                              style: TextStyleHelper.textDate
                                  .copyWith(color: ThemeHelper.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            '+${priceProduct.toString()}',
                            style: TextStyleHelper.f16fw700
                                .copyWith(color: ThemeHelper.white),
                          ),
                        ],
                      ),
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 44.h);
                      },
                      itemCount: 6,
                    ),
                  ),
                  SizedBox(height: 45.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'ИТОГО ЗА ДЕНЬ',
                        style: TextStyleHelper.f14w600,
                      ),
                      Text(
                        '120.00',
                        style: TextStyleHelper.f16fw700
                            .copyWith(color: ThemeHelper.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
