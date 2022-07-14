import 'package:cashback_app/screens/bottomNavigation/myBottomNavigation.dart';
import 'package:cashback_app/screens/seller/shop/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CatProductBuyer extends StatefulWidget {
  const CatProductBuyer({Key? key}) : super(key: key);

  @override
  State<CatProductBuyer> createState() => _CatProductBuyerState();
}

class _CatProductBuyerState extends State<CatProductBuyer> {
  double balance = 300;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Color.fromRGBO(23, 69, 59, 0.8),
          
          centerTitle: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                children: [
                  const Text(
              '   КАТАЛОГ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),SizedBox(width: 49.w,),
                  Text(
                    "$balance",
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(255, 214, 0, 1)),
                  ),
                  Container(width: 22, height: 19, child: Image.asset("assets/images/coin.png",fit: BoxFit.cover, ))
                ],
              ),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 21,
          right: 20,
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 39.h,
            ),
            SearchField(),
            SizedBox(
              height: 22.h,
            ),
            SingleProductByuer(),
            SizedBox(
              height: 28.h,
            ),
            SingleProductByuer(),
            SizedBox(
              height: 28.h,
            ),
            SingleProductByuer(),
            SizedBox(
              height: 28.h,
            ),
            SingleProductByuer(),
            SizedBox(
              height: 28.h,
            ),
            SingleProductByuer(),
          ]),
        ),
      ),
        bottomNavigationBar: CustomBottomNavigator(currentPage: 2),
    );
  }
}

class SingleProductByuer extends StatelessWidget {
  const SingleProductByuer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 334,
          height: 98,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromRGBO(255, 255, 255, 1),
            boxShadow: [BoxShadow(
                      color: Color.fromRGBO(23, 69, 59, 0.2),
                      offset: const Offset(0.9, 0.9),
                      blurRadius: 0.9,
                      spreadRadius: 0.9,
                    ), ]
          ),
          child: Row(
            children: [
              SizedBox(
                width: 19,
              ),
              Container(
                width: 60.w,
                height: 60.h,
                color: Color.fromRGBO(23, 69, 59, 0.5),
              ),
              SizedBox(
                width: 13.w,
                height: 22.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  const Text(
                    "ICE Tea (зеленый)",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(23, 69, 59, 0.8),
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  const Text(
                    "Напитки",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(23, 69, 59, 0.8),
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 147.w,
                      ),
                     const Text(
                        "90 cом/",
                        style: TextStyle(
                          color: Color.fromRGBO(23, 69, 59, 0.8),
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "+9",
                        style: TextStyle(
                          color: Colors.yellow[600],
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                          width: 12,
                          height: 11,
                          child: Image.asset(
                            "assets/images/coin.png",
                            fit: BoxFit.cover,
                            color: Colors.amber,
                          ))
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: 14.w,
        ),
      ],
    );
  }
}
