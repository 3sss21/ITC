import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BalanceHistory extends StatefulWidget {
  const BalanceHistory({Key? key}) : super(key: key);

  @override
  State<BalanceHistory> createState() => _BalanceHistoryState();
}

class _BalanceHistoryState extends State<BalanceHistory> {
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
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(children: [
          SizedBox(
            height: 149.h,
          ),
          Row(
   mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Color.fromRGBO(69, 106, 98, 1),
                ),
              ),
           const   Text(
                "назад",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(69, 106, 98, 0.8)),
              ),
             const SizedBox(width: 189,),
            const  Text("30.07.2022", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
            ],
          )
        ]),
      ),
    );
  }
}
