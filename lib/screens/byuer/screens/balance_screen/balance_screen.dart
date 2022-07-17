import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/appCover_balance_widget.dart';
import 'package:cashback_app/screens/byuer/screens/balance_screen/balance_history.dart';
import 'package:cashback_app/screens/seller/screens/boxOffice_screen.dart/local_widget/history_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({Key? key}) : super(key: key);

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  late bool isState;

  @override
  void initState() {
    isState = true;
    super.initState();
  }
  double balance = 300;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AppCoverBalanceWidget(
            nameCover: 'БАЛАНС',
            balance: 300,
          ),
          
          Expanded(
            // width: 1.sw,
            // height: 0.726.sh,
            child: isState ? ListView.separated(
              padding: EdgeInsets.only(left: 20.w, top: 25.h, right: 20.w),
              itemCount: 20,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 334.w,
                  child: HistoryButton(
                    textStyleDate: TextStyleHelper.textDate,
                    textStyleBalance: TextStyleHelper.textBalance.copyWith(color: ThemeHelper.green100),
                    function: () {
                      setState(() {
                        isState = false;
                      });
                    },
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 16.h);
              },
            ) : const BalanceHistory(),
          ) ,
        ],
      ),
    );
  }
}
