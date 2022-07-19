import 'package:cashback_app/basket/shop/catalog.dart';
import 'package:cashback_app/commons/icon_images.dart';
import 'package:cashback_app/screens/byuer/screens/shop_screen/shop_screen.dart';
import 'package:cashback_app/screens/seller/basket/seller_basket.dart';
import 'package:cashback_app/screens/seller/screens/boxOffice_screen.dart/boxOffice_screen.dart';
import 'package:cashback_app/screens/seller/screens/boxOffice_screen.dart/cashBox_screen.dart';
import 'package:cashback_app/screens/seller/screens/branch_screen/branch_screen.dart';
import 'package:cashback_app/screens/seller/screens/clients_screen/clients_screen.dart';
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
    const BranchScreen(),
    const CatalogScreen(),
    const Basket(),
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
            canvasColor: const Color(0xff17453B),
          ),
          child: BottomNavigationBar(
            showUnselectedLabels: false,
            showSelectedLabels: false,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            iconSize: 40,
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    IconsImages.branchIcon,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    IconsImages.clientsIcon,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    IconsImages.shopIcon,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    IconsImages.incomeIcon,
                  ),
                ),
                label: '',
              ),
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
