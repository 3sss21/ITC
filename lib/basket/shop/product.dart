
import 'package:cashback_app/global_widgets/search_textfield_widget.dart';
import 'package:cashback_app/screens/seller/seller_navigation/seller_navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'catalog.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Color.fromRGBO(23, 69, 59, 0.8),
          title: const Text(
            '      КАТАЛОГ',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          centerTitle: false,
          actions: [
            Image.asset("assets/images/feliz_logo.png"),
            SizedBox(
              width: 20.w,
              child: Text(""),  // peredelat'
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
       SearchTextFieldWidget(hintText: "Poisk"),
            SizedBox(
              height: 22.h,
            ),
            SingleProduct(),
            SizedBox(
              height: 28.h,
            ),
            SingleProduct(),
            SizedBox(
              height: 28.h,
            ),
            SingleProduct(),
            SizedBox(
              height: 28.h,
            ),
            SingleProduct(),
              SizedBox(
              height: 28.h,
            ),
            SingleProduct(),

          ]),
        ),
      ),
      // bottomNavigationBar: SellerNavigationWidget(currentIndex: 2,),
    );
  }
}

class SingleProduct extends StatelessWidget {
  const SingleProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 260,
          height: 98,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromRGBO(23, 69, 59, 0.8),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 19,
              ),
              Container(
                width: 60.w,
                height: 60.h,
                color: Colors.white,
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
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  const Text(
                    "Напитки",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 78.w,
                      ),
                      Text(
                        "90 cом/",
                        style: TextStyle(
                          color: Colors.white,
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 45.w,
              height: 45.h,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(23, 69, 59, 0.25),
                      blurRadius: 20,
                    )
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: Colors.white),
              child: IconButton(
                icon: const Text(
                  "+",
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(23, 69, 59, 1)),
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              width: 45.w,
              height: 45.h,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(23, 69, 59, 0.25),
                      blurRadius: 20,
                    )
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: Colors.white),
              child: IconButton(
                icon: Image.asset(
                  "assets/images/basket.png",
                  color: Color.fromRGBO(23, 69, 59, 1),
                ),
                onPressed: () {},
              ),
            ),
          ],
        )
      ],
    );
  }
}
