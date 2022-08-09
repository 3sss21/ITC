import 'package:cashback_app/commons/barItem_helper.dart';
import 'package:cashback_app/commons/icon_images.dart';
import 'package:cashback_app/screens/seller/screens/boxOffice_screen.dart/boxOffice_screen.dart';
import 'package:cashback_app/screens/seller/screens/catalog_basket_screens/catalog_screen/catalog_screen.dart';
import 'package:cashback_app/screens/seller/screens/catalog_basket_screens/scannerQRCode_screen/scannerQRCode_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SellerNavigationWidget extends StatefulWidget {
  final int currentIndex;

  const SellerNavigationWidget({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  State<SellerNavigationWidget> createState() => _SellerNavigationWidgetState();
}

class _SellerNavigationWidgetState extends State<SellerNavigationWidget> {
  late int _selectedIndex;

  final List<Widget> _widgetOptions = <Widget>[
    const CatalogScreen(),
    const ScannerQRCodeScreen(),
    const BoxOfficeScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _selectedIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Color.fromRGBO(83, 42, 42, 0.8),
          ),
          child: BottomNavigationBar(
            showUnselectedLabels: false,
            showSelectedLabels: false,
            items: [
              BarItemHelper().barItem(IconsImages.shopIcon),
              BarItemHelper().barItem(IconsImages.iconBasket),
              BarItemHelper().barItem(IconsImages.incomeIcon),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
