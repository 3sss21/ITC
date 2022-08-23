import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/feliz_logo_widget.dart';
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
  late BranchBloc branchBloc;

  @override
  void initState() {
    branchBloc = BranchBloc();
    branchBloc.add(GetBranchEvent());
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
              bloc: branchBloc,
              listener: (context, state) {},
              builder: (context, state) {
                if (state is LoadingBranchState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is ErrorBranchState) {
                  return Center(
                    child: ElevatedButton(
                      onPressed: () => branchBloc.add(GetBranchEvent()),
                      child: const Text('Try Again'),
                    ),
                  );
                }

                if (state is LoadedBranchState) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          "Выбирите филиал",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: ThemeHelper.green80,
                          ),
                        ),
                        SizedBox(height: 43.h),
                        SizedBox(
                          height: 1.sh,
                          width: 1.sw,
                          child: ListView.separated(
                            itemCount: state.branchModel.length,
                            itemBuilder: (context, index) => BranchButton(
                              fontSize: 20,
                              width: 300,
                              height: 100,
                              titleOfBranch:
                                  state.branchModel[index].branchName!,
                              function: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ShopScreen(),
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
