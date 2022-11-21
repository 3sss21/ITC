import 'package:cashback_app/commons/icon_images.dart';
import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/appCover_widget.dart';
import 'package:cashback_app/global_widgets/btnTryAgain_widget.dart';
import 'package:cashback_app/global_widgets/loadingIndicator_widget.dart';
import 'package:cashback_app/global_widgets/search_textfield_widget.dart';
import 'package:cashback_app/screens/buyer/screens/shop_screen/local_widgets/product_name_widget.dart';
import 'package:cashback_app/screens/seller/screens/seller_catalog_screen/bloc/seller_catalog_bloc.dart';
import 'package:cashback_app/screens/seller/screens/seller_catalog_screen/product_screen/seller_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../seller_navigation/seller_navigation_widget.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  void updateList(String value) {}

  late SellerCatalogBloc catallogSellerBloc;

  // @override
  // void initState() {
  // catallogSellerBloc = SellerCatalogBloc();
  // catallogSellerBloc.add(GetCatalogEvent());
  // super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppCoverWidget(
            nameCover: 'КАТАЛОГ',
            isSeller: true,
          ),
          SizedBox(height: 39.h),
          SearchTextFieldWidget(
            hintText: 'Поиск',
            hintTextColor: ThemeHelper.brown80,
            fillColor: ThemeHelper.brown20,
            prefix: Icon(
              Icons.search_outlined,
              size: 25.r,
              color: ThemeHelper.brown80,
            ),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.only(top: 30.h),
              itemCount: 8,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 80.w,
                mainAxisSpacing: 53.w,
                crossAxisCount: 2,
                crossAxisSpacing: 30.h,
              ),
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 21.w),
                child: ProductNameWidget(
                  textStyle: TextStyleHelper.productNameGreen80,
                  borderColor: ThemeHelper.brown80,
                  productName:
                      // state.catalogSellerModel[index].name ??
                      'testName',
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProductSellerScreen(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigator(currentPage: 0),
    );
  }
}
