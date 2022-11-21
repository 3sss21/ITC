import 'package:auto_route/auto_route.dart';
import 'package:cashback_app/commons/barItem_helper.dart';
import 'package:cashback_app/commons/icon_images.dart';
import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/screens/seller/screens/basket_screens/basket_screen/basket_screen.dart';
import 'package:cashback_app/screens/seller/screens/boxOffice_screen.dart/boxOffice_screen.dart';
import 'package:cashback_app/screens/seller/screens/seller_catalog_screen/catalog_screen/catalog_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/boxOffice_screen.dart/cashBox_screen.dart';
import '../screens/seller_catalog_screen/product_screen/seller_product_screen.dart';

class CustomBottomNavigator extends StatelessWidget {
  final int currentPage;

  CustomBottomNavigator({this.currentPage = 0});

  List<BottomNavigationBarItem> _generateItemList() {
    
    var items = <BottomNavigationBarItem>[
     BottomNavigationBarItem(
      icon: Image.asset(
        IconsImages.shopIcon,
        width: 40.w,
        height: 40.h,
        color: ThemeHelper.white50,
      ),
      activeIcon: Image.asset(
         IconsImages.shopIcon,
        width: 40.w,
        height: 40.h,
        color: ThemeHelper.white,
      ),
      label: "Каталог",
    ),
      BottomNavigationBarItem(
      icon: Image.asset(
        IconsImages.iconBasket,
        width: 40.w,
        height: 40.h,
        color: ThemeHelper.white50,
      ),
      activeIcon: Image.asset(
        IconsImages.iconBasket,
        width: 40.w,
        height: 40.h,
        color: ThemeHelper.white,
      ),
      label: "Корзина",
    ),
      BottomNavigationBarItem(
      icon: Image.asset(
       IconsImages.incomeIcon,
        width: 40.w,
        height: 40.h,
        color: ThemeHelper.white50,
      ),
      activeIcon: Image.asset(
         IconsImages.incomeIcon,
        width: 40.w,
        height: 40.h,
        color: ThemeHelper.white,
      ),
      label: "Касса",
    ),
      
    ];
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: _generateItemList(),
      selectedItemColor: ThemeHelper.white,
      unselectedItemColor: ThemeHelper.white50,
      selectedLabelStyle: TextStyleHelper.labelStyle,
      unselectedLabelStyle: TextStyleHelper.labelStyle,
      showUnselectedLabels: true,
      backgroundColor: Color.fromRGBO(83, 42, 42, 0.8),
      iconSize: 24,
      unselectedFontSize: 14,
      onTap: (index) async {
        switch (index) {
          case 0:
            {
              if (currentPage != index) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CatalogScreen()));
              }
              break;
            }
          case 1:
            {
              if (currentPage != index) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BasketScreen()));
              }
              break;
            }
          case 2:
            {
              if (currentPage != index) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BoxOfficeScreen()));
              }
              break;
            }
        }
      },
      currentIndex: currentPage,
      type: BottomNavigationBarType.fixed,
    );
  }
}

