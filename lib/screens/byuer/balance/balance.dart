import 'package:cashback_app/screens/seller/income/screen_1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({Key? key}) : super(key: key);

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
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
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Row(
                children: [
                  const Text(
                    'БАЛАНС',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: 49.w,
                  ),
                  Text(
                    "$balance",
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(255, 214, 0, 1)),
                  ),
                  Container(
                      width: 22,
                      height: 19,
                      child: Image.asset(
                        "assets/images/coin.png",
                        fit: BoxFit.cover,
                      ))
                ],
              ),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 31,
                ),
                SizedBox(
                  width: 334.w,
                  height: 38.h,
                  child: TextField(
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Color.fromRGBO(23, 69, 59, 0.8),
                      ),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(23, 69, 59, 0.2),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "DD/MM/YY",
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(23, 69, 59, 0.8),
                              fontSize: 20),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueAccent, width: 32.0),
                              borderRadius: BorderRadius.circular(25.0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(23, 69, 59, 0.8)),
                              borderRadius: BorderRadius.circular(25.0)))),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Container(
                  width: 334.w,
                  height: 1.sh,
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Container(
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(23, 69, 59, 0.25),
                                  blurRadius: 12,
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                primary: const Color.fromRGBO(255, 255, 255, 1),
                                maximumSize: Size(334.w, 40.h),
                                minimumSize: Size(334.w, 40.h),
                              ),
                              onPressed: () {
                                // Navigator.push(context, route)
                              },
                              child: Row(children: [
                                SizedBox(
                                  width: 33.w,
                                ),
                                const Text(
                                  "06.06.22",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(23, 69, 59, 0.8)),
                                ),
                                SizedBox(
                                  width: 120.w,
                                ),
                                const Text(
                                  "+80.00",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(255, 214, 0, 1),
                                  ),
                                ),
                              ]),
                            ),
                          ));
                    },
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
