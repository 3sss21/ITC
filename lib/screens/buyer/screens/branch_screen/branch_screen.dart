import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/btnTryAgain_widget.dart';
import 'package:cashback_app/global_widgets/feliz_logo_widget.dart';
import 'package:cashback_app/global_widgets/loadingIndicator_widget.dart';
import 'package:cashback_app/global_widgets/refresh_indicator_widget.dart';
import 'package:cashback_app/screens/buyer/screens/branch_screen/bloc/branch_bloc.dart';
import 'package:cashback_app/screens/buyer/screens/branch_screen/local_widget/branch_button.dart';
import 'package:cashback_app/screens/buyer/screens/shop_screen/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BranchScreen extends StatefulWidget {
  const BranchScreen({Key? key}) : super(key: key);

  @override
  State<BranchScreen> createState() => _BranchScreenState();
}

class _BranchScreenState extends State<BranchScreen> {
  late BranchBloc _branchBloc;

  @override
  void initState() {
    _branchBloc = BranchBloc();
    _branchBloc.add(GetBranchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const FelizLogoWidget(),
          Positioned(
            top: 196.h,
            left: 37.w,
            right: 37.w,
            child: BlocConsumer<BranchBloc, BranchState>(
              bloc: _branchBloc,
              listener: (context, state) {},
              builder: (context, state) {
                if (state is LoadingBranchState) {
                  return LoadingIndicatorWidget(
                    width: 50.w,
                    height: 50.h,
                    color: ThemeHelper.green80,
                  );
                }

                if (state is ErrorBranchState) {
                  return ButtonTryAgainWidget(
                    onPressed: () => _branchBloc.add(
                      GetBranchEvent(),
                    ),
                    btnTheme: ThemeHelper.green80,
                  );
                }

                if (state is LoadedBranchState) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          "Выбирите филиал",
                          style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w700,
                            color: ThemeHelper.green80,
                          ),
                        ),
                        SizedBox(height: 43.h),
                        SizedBox(
                          height: 1.sh,
                          width: 1.sw,
                          child: RefreshIndicatorWidget(
                            onRefresh: () async => _branchBloc.add(
                              GetBranchEvent(),
                            ),
                            color: ThemeHelper.green80,
                            child: ListView.separated(
                              itemCount: state.branchModelList.length,
                              itemBuilder: (context, index) => BranchButton(
                                fontSize: 20.sp,
                                width: 300.w,
                                height: 100.h,
                                titleOfBranch:
                                    state.branchModelList[index].name!,
                                function: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ShopScreen(
                                        listOfCategory: state
                                            .branchModelList[index]
                                            .listCategories!,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(height: 43.h);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
