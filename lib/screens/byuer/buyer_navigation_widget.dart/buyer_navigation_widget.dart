import 'package:cashback_app/commons/icon_images.dart';
import 'package:cashback_app/screens/byuer/screens/QR_code_screen/QR_code_screen.dart';
import 'package:cashback_app/screens/byuer/screens/balance_screen/balance_screen.dart';
import 'package:cashback_app/screens/byuer/screens/profile_screen/profile_screen.dart';
import 'package:cashback_app/screens/byuer/screens/shop_screen/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuyerNavigationWidget extends StatefulWidget {
  final int currentIndex;
  const BuyerNavigationWidget({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<BuyerNavigationWidget> createState() => _BuyerNavigationWidgetState();
}

class _BuyerNavigationWidgetState extends State<BuyerNavigationWidget> {
  late int _selectedIndex;

  final List<Widget> _widgetOptions = <Widget>[
    const ShopScreen(),
    const BalanceScreen(),
    const QrCodeScreen(),
    const ProfileSceen(),
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
                   IconsImages.shopIcon,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    IconsImages.balanceIcon,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    IconsImages.qrCodeIcon,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    IconsImages.profileIcon
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
