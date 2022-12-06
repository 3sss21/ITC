import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/appCover_balance_widget.dart';
import 'package:cashback_app/global_widgets/btnTryAgain_widget.dart';
import 'package:cashback_app/global_widgets/loadingIndicator_widget.dart';
import 'package:cashback_app/screens/buyer/screens/balance_screen/bloc/balance_bloc.dart';
import 'package:cashback_app/screens/seller/screens/boxOffice_screen.dart/local_widget/history_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({Key? key}) : super(key: key);

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  late BalanceBloc balanceBloc;
  Box cashbackAll = Hive.box('userDataBox');

  @override
  void initState() {
    balanceBloc = BalanceBloc();
    balanceBloc.add(GetBalanceEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppCoverBalanceWidget(
              nameCover: 'БАЛАНC',
              balance: cashbackAll.get('cashbackAll'),
            ),
            BlocConsumer<BalanceBloc, BalanceState>(
              bloc: balanceBloc,
              listener: (context, state) {},
              builder: (context, state) {
                if (state is LoadingBalanceState) {
                  return LoadingIndicatorWidget(
                    width: 50.w,
                    height: 50.h,
                    color: ThemeHelper.green80,
                  );
                }

                if (state is ErrorBalanceState) {
                  return ButtonTryAgainWidget(
                    onPressed: () => balanceBloc.add(
                      GetBalanceEvent(),
                    ),
                    btnTheme: ThemeHelper.green80,
                  );
                }

                if (state is LoadedBalanceState) {
                  return Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.only(
                        left: 20.w,
                        top: 25.h,
                        right: 20.w,
                      ),
                      itemCount: state.balanceModel.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: 334.w,
                          child: HistoryButton(
                            dateTimeBalance:
                                state.balanceModel[index].dateTime!,
                            balance: state.balanceModel[index].listOfPoints!
                                .elementAt(1),
                            textStyleDate: TextStyleHelper.textDate,
                            textStyleBalance: TextStyleHelper.f16fw700
                                .copyWith(color: ThemeHelper.green100),
                            function: () {},
                          ),
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
      ),
    );
  }
}
