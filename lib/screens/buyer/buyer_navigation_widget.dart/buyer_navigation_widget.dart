import 'package:cashback_app/commons/barItem_helper.dart';
import 'package:cashback_app/commons/icon_images.dart';
import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_blocs/user_data_bloc/profile_bloc.dart';
import 'package:cashback_app/screens/buyer/screens/QR_code_screen/QR_code_screen.dart';
import 'package:cashback_app/screens/buyer/screens/balance_screen/balance_screen.dart';
import 'package:cashback_app/screens/buyer/screens/branch_screen/branch_screen.dart';
import 'package:cashback_app/screens/buyer/screens/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BuyerNavigationWidget extends StatefulWidget {
  final int currentIndex;
  const BuyerNavigationWidget({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  State<BuyerNavigationWidget> createState() => _BuyerNavigationWidgetState();
}

class _BuyerNavigationWidgetState extends State<BuyerNavigationWidget> {
  late int _selectedIndex;

  final List<Widget> _widgetOptions = <Widget>[
    const BranchScreen(),
    const BalanceScreen(),
    const QrCodeScreen(),
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
            canvasColor: ThemeHelper.green80,
          ),
          child: BottomNavigationBar(
            showSelectedLabels: true,
            selectedItemColor: ThemeHelper.white,
            unselectedItemColor: ThemeHelper.white50,
            selectedLabelStyle: TextStyleHelper.labelStyle,
            unselectedLabelStyle: TextStyleHelper.labelStyle,
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BarItemHelper().barItem(IconsImages.shopIcon, 'Каталог'),
              BarItemHelper().barItem(IconsImages.balanceIcon, 'Баланс'),
              BarItemHelper().barItem(IconsImages.qrCodeIcon, 'QR-code'),
              BarItemHelper().barItem(IconsImages.profileIcon, 'Профиль'),
            ],
            currentIndex: _selectedIndex,
            onTap: (int index) {
              setState(
                () {
                  _selectedIndex = index;
                },
              );
            },
          ),
          // BottomNavigationBar(
          //   showUnselectedLabels: true,
          //   showSelectedLabels: true,
          //   selectedItemColor: ThemeHelper.white,
          //   unselectedItemColor: ThemeHelper.white50,
          //   selectedLabelStyle: TextStyleHelper.labelStyle,
          //   unselectedLabelStyle: TextStyleHelper.labelStyle,
          //   items: [
          //     BarItemHelper().barItem(IconsImages.shopIcon, 'Каталог'),
          //     BarItemHelper().barItem(IconsImages.balanceIcon, 'Баланс'),
          //     BarItemHelper().barItem(IconsImages.qrCodeIcon, 'QR-code'),
          //     BarItemHelper().barItem(IconsImages.profileIcon, 'Профиль'),
          //   ],
          //   type: BottomNavigationBarType.fixed,
          //   currentIndex: _selectedIndex,
          //   onTap: _onItemTapped,
          // ),
        ),
      ),
    );
  }
}
