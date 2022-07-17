import 'package:cashback_app/global_widgets/appCover_balance_widget.dart';
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
    return Column(
      children: [
        
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
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
                  const Text(
                    "назад",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(69, 106, 98, 0.8)),
                  ),
                  const SizedBox(
                    width: 189,
                  ),
                  const Text(
                    "30.07.2022",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
