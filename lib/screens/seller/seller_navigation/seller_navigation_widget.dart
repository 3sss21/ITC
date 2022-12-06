import 'package:cashback_app/commons/barItem_helper.dart';
import 'package:cashback_app/commons/icon_images.dart';
import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/screens/buyer/screens/profile_screen/profile_screen.dart';
import 'package:cashback_app/screens/seller/screens/basket_screens/basket_screen/basket_screen.dart';
import 'package:cashback_app/screens/seller/screens/boxOffice_screen.dart/boxOffice_screen.dart';
import 'package:cashback_app/screens/seller/screens/seller_catalog_screen/catalog_screen/catalog_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SellerNavigationWidget extends StatefulWidget {
  final int currentIndex;

  const SellerNavigationWidget({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<SellerNavigationWidget> createState() => _SellerNavigationWidgetState();
}

class _SellerNavigationWidgetState extends State<SellerNavigationWidget> {
  late int _selectedIndex;

  final List<Widget> _widgetOptions = <Widget>[
    const CatalogScreen(),
    const BasketScreen(),
    const BoxOfficeScreen(),
    const ProfileSceen(),
  ];

  @override
  void initState() {
    _selectedIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: _widgetOptions,
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: ThemeHelper.brown80,
          ),
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            selectedItemColor: ThemeHelper.white,
            unselectedItemColor: ThemeHelper.white50,
            selectedLabelStyle: TextStyleHelper.labelStyle,
            unselectedLabelStyle: TextStyleHelper.labelStyle,
            items: [
              BarItemHelper().barItem(IconsImages.shopIcon, 'Каталог'),
              BarItemHelper().barItem(IconsImages.iconBasket, 'Корзина'),
              BarItemHelper().barItem(IconsImages.incomeIcon, 'Касса'),
              BarItemHelper().barItem(IconsImages.incomeIcon, 'Профиль'),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: (int index) {
              setState(
                () {
                  _selectedIndex = index;
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
