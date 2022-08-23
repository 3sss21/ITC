import 'package:cashback_app/commons/screens_state.dart';
import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/appCover_balance_widget.dart';
import 'package:cashback_app/screens/buyer/screens/balance_screen/balance_history.dart';
import 'package:cashback_app/screens/buyer/screens/balance_screen/bloc/balance_bloc.dart';
import 'package:cashback_app/screens/seller/screens/boxOffice_screen.dart/local_widget/history_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({Key? key}) : super(key: key);

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  late BalanceBloc balanceBloc;

  @override
  void initState() {
    balanceBloc = BalanceBloc();
    balanceBloc.add(GetBalanceEvent());
    super.initState();
  }

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
          BlocConsumer<BalanceBloc, BalanceState>(
            bloc: balanceBloc,
            listener: (context, state) {},
            builder: (context, state) {
              if (state is LoadingBalanceState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is ErrorBalanceState) {
                return Center(
                  child: ElevatedButton(
                    onPressed: () => balanceBloc.add(GetBalanceEvent()),
                    child: const Text('Try Again'),
                  ),
                );
              }

              if (state is LoadedBalanceState) {
                return SizedBox(
                  width: 1.sw,
                  height: 0.726.sh,
                  child: ListView.separated(
                    padding: EdgeInsets.only(
                      left: 20.w,
                      top: 25.h,
                      right: 20.w,
                    ),
                    itemCount: state.balanceModel.length,
                    itemBuilder: (context, index) {
                      return ScreensState.isState
                          ? SizedBox(
                              width: 334.w,
                              child: HistoryButton(
                                dateTimeBalance:
                                    state.balanceModel[index].dateTime!,
                                balance: state.balanceModel[index].listOfPoints!
                                    .elementAt(1),
                                textStyleDate: TextStyleHelper.textDate,
                                textStyleBalance: TextStyleHelper.f16fw700
                                    .copyWith(color: ThemeHelper.green100),
                                function: () {
                                  setState(() {
                                    ScreensState.isState = false;
                                  });
                                },
                              ),
                            )
                          : BoxPurchaseHistoryWidget(
                              datePurchase: state.balanceModel[index].dateTime!,
                              listOfProduct:
                                  state.balanceModel[index].listOfProducts!,
                              listOfPoints:
                                  state.balanceModel[index].listOfPoints!,
                              function: () {
                                setState(() {
                                  ScreensState.isState = true;
                                });
                              },
                            );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 16.h);
                    },
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}