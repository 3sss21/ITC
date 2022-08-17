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

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';

// class BottomNavigator extends StatefulWidget {
//   final int currentPage;
//   BottomNavigator({this.currentPage = 0});
//   @override
//   _BottomNavigatorState createState() => _BottomNavigatorState();
// }

// class _BottomNavigatorState extends State<BottomNavigator> {
//   late IO.Socket socket;
//   void sendMessage() async {
//     socket = io(
//         'http://alecia.voilalex.com:5501/messages',
//         OptionBuilder()
//             .setTransports(['websocket'])
//             .disableAutoConnect()
//             .setExtraHeaders({
//               'X-Auth-Token': await getJwta(),
//               'X-Auth-Refresh-Token': await getJwtr()
//             })
//             .build());
//     socket.connect();
//     socket.onConnect((_) {
//       setState(() {
//         Utils.counter++;
//       });
//       socket.on('new-message', (message) {
//         bloc.add(GetAuthMeEvent());
//         Messages messagesList = Messages.fromJson(message["message"]);
//         if (Utils.showNotif == true) {
//           //  if (messagesList.userId != CustomGender.id) {
//           //   listenNotifications();
//           NotificationApi.showNotification(
//               context: context,
//               title: 'Alecia',
//               body: AppLocalizations.of(context)?.new_message);
//           //   }
//         }
//       });
//     });
//   }

//   @override
//   void dispose() {
//     socket.disconnect();
//     super.dispose();
//   }

//   List<BottomNavigationBarItem> _generateItemList(
//       String gender, String avatar, int chatCounter) {
//     if (gender == "Женщина") {
//       Utils.gender = 'Female';
//     } else if (gender == "Male" || gender == 'Homme') {
//       Utils.gender = 'Male';
//     }
//     return Utils.gender == 'Male'
//         ? <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               backgroundColor: Colors.white,
//               label: 'Menu',
//               activeIcon: Icon(Icons.menu),
//               icon: Icon(Icons.menu, color: Color(0xff757575)),
//             ),
//             BottomNavigationBarItem(
//               backgroundColor: Colors.white,
//               label: 'Ladies',
//               activeIcon: Image.asset(
//                 "assets/images/ladiesIcon.png",
//                 width: 25,
//                 height: 25,
//                 color: Colors.blue,
//               ),
//               icon: Image.asset(
//                 "assets/images/ladiesIcon.png",
//                 width: 25,
//                 height: 25,
//               ),
//             ),
//             BottomNavigationBarItem(
//               backgroundColor: Colors.white,
//               label: 'Chat',
//               activeIcon: notificationIcon(chatCounter, Colors.blue),
//               icon: notificationIcon(chatCounter, Color(0xff757575)),
//             ),
//             BottomNavigationBarItem(
//               backgroundColor: Colors.white,
//               label: 'Profile',
//               activeIcon: customImage(avatar),
//               icon: customImage(avatar),
//             ),
//           ]
//         : <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               backgroundColor: Colors.white,
//               label: 'Меню',
//               activeIcon: Icon(Icons.menu),
//               icon: Icon(Icons.menu, color: Color(0xff757575)),
//             ),
//             BottomNavigationBarItem(
//               backgroundColor: Colors.white,
//               label: 'Чат',
//               activeIcon: notificationIcon(chatCounter, Colors.blue),
//               icon: notificationIcon(chatCounter, Color(0xff757575)),
//             ),
//             BottomNavigationBarItem(
//                 backgroundColor: Colors.white,
//                 label: 'Профиль',
//                 activeIcon: customImage(avatar),
//                 icon: customImage(avatar)),
//           ];
//   }

//   final bloc = AuthMeBloc(UserMeRepository());
//   @override
//   void initState() {
//     Utils.showNotif = true;
//     bloc.add(GetAuthMeEvent());
//     sendMessage();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // var _localizationProvider = AppLocalizations.of(context);
//     return BlocConsumer<AuthMeBloc, AuthMeState>(
//       bloc: bloc,
//       listener: (context, state) {
//         if (state is AuthMeLoadedState) {
//           final provider = Provider.of<LocaleProvider>(context, listen: false);
//           Utils.gender = state.model.me!.gender!;
//           if (Utils.gender == 'Женщина') {
//             provider.setLocale(Locale("ru"));
//           } else if (Utils.gender == 'Male') {
//             provider.setLocale(Locale("en"));
//           } else if (Utils.gender == 'Homme') {
//             provider.setLocale(Locale("fr"));
//           }
//         }
//       },
//       builder: (context, state) {
//         if (state is AuthMeLoadedState) {
//           return initialScreen(state.model.me!.gender!, state.model.me!.id!,
//               state.model.me!.avatar!, state.model.me!.unreadChatsCount!);
//         } else if (state is AuthMeLoadingState) {
//           return loadingIndicator();
//         } else if (state is AuthMeInitial) {
//           return loadingIndicator();
//         }
//         if (state is AuthMeErrorState) {
//           return initialScreen('', '', '', 0);
//         }
//         return Text('');
//       },
//     );
//   }

//   Widget initialScreen(
//       String gender, String id, String avatar, int unreadChatsCount) {
//     CustomGender.id = id;
//     return BottomNavigationBar(
//       selectedItemColor: Colors.blue,
//       selectedIconTheme: IconThemeData(color: Colors.blue),
//       selectedFontSize: 12,
//       selectedLabelStyle: TextStyle(fontSize: 14),
//       unselectedFontSize: 12,
//       unselectedItemColor: Color(0xff757575),
//       items: _generateItemList(gender, avatar, unreadChatsCount),
//       iconSize: 24,
//       onTap: (index) async {
//         if (gender == "Женщина") {
//           switch (index) {
//             case 0:
//               {
//                 Navigator.pushNamedAndRemoveUntil(
//                     context, '/menu', (route) => false);
//                 break;
//               }
//             case 1:
//               {
//                 Navigator.pushNamedAndRemoveUntil(
//                     context, '/chat', (route) => false);
//                 break;
//               }
//             case 2:
//               {
//                 Navigator.pushNamedAndRemoveUntil(
//                     context, '/profile', (route) => false);
//                 break;
//               }
//           }
//         } else {
//           switch (index) {
//             case 0:
//               {
//                 Navigator.pushNamedAndRemoveUntil(
//                     context, '/menu', (route) => false);
//                 break;
//               }
//             case 1:
//               {
//                 Navigator.pushNamedAndRemoveUntil(
//                     context, '/ladies', (route) => false);
//                 break;
//               }
//             case 2:
//               {
//                 Navigator.pushNamedAndRemoveUntil(
//                     context, '/chat', (route) => false);
//                 break;
//               }
//             case 3:
//               {
//                 Navigator.pushNamedAndRemoveUntil(
//                     context, '/profile', (route) => false);
//                 break;
//               }
//           }
//         }
//       },
//       currentIndex: widget.currentPage,
//       type: BottomNavigationBarType.fixed,
//     );
//   }
// }
