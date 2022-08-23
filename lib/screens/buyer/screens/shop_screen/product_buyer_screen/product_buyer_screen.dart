import 'package:cashback_app/commons/icon_images.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/appCover_widget.dart';
import 'package:cashback_app/global_widgets/search_textfield_widget.dart';
import 'package:cashback_app/screens/buyer/screens/shop_screen/local_widgets/product_info_box_widget.dart';
import 'package:cashback_app/screens/buyer/screens/shop_screen/product_buyer_screen/bloc/product_buyer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuyerProductScreen extends StatefulWidget {
  const BuyerProductScreen({Key? key}) : super(key: key);

  @override
  State<BuyerProductScreen> createState() => _BuyerProductScreenState();
}

class _BuyerProductScreenState extends State<BuyerProductScreen> {
  late ProductBuyerBloc productBuyerBloc;

  @override
  void initState() {
    productBuyerBloc = ProductBuyerBloc();
    productBuyerBloc.add(GetProductBuyerEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppCoverWidget(
            nameCover: 'КАТАЛОГ',
            isSeller: false,
            isBackButton: true,
          ),
          SizedBox(height: 39.h),
          SearchTextFieldWidget(
            hintText: 'Поиск',
            prefix: ImageIcon(
              AssetImage(IconsImages.searchIcon),
              color: ThemeHelper.green80,
            ),
            fillColor: null,
            hintTextColor: Colors.red,
          ),
          BlocConsumer<ProductBuyerBloc, ProductBuyerState>(
            bloc: productBuyerBloc,
            listener: (context, state) {},
            builder: (context, state) {
              if (state is ProductBuyerLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is ProductBuyerErrorState) {
                return Center(
                  child: ElevatedButton(
                    onPressed: () => productBuyerBloc.add(
                      GetProductBuyerEvent(),
                    ),
                    child: const Text('Try Again'),
                  ),
                );
              }

              if (state is ProductByuerFetchedState) {
                return Expanded(
                  // child: GridView.builder(
                  //         padding: EdgeInsets.only(top: 57.h),
                  //         itemCount:state.catalogBuyerModel.length,
                  //         gridDelegate:
                  //             SliverGridDelegateWithFixedCrossAxisCount(
                  //           mainAxisExtent: 80.w,
                  //           mainAxisSpacing: 53.w,
                  //           crossAxisCount: 2,
                  //           crossAxisSpacing: 54.h,
                  //         ),
                  //         itemBuilder: (context, index) => Padding(
                  //           padding: EdgeInsets.symmetric(horizontal: 21.w),
                  //           child: ProductNameWidget(
                  //             productName:
                  //                 state.catalogBuyerModel[index].name ??"unknown",
                  //             function: () {
                  //               setState(() {
                  //                 ScreensState.isState = false;
                  //               });
                  //             },
                  //           ),
                  //         ),
                  //       )
                  child: ListView.separated(
                    padding: EdgeInsets.only(
                      left: 20.w,
                      top: 21.h,
                      right: 20.w,
                    ),
                    itemCount: state.productBuyerModel.length,
                    itemBuilder: (context, index) => ProductInfoBoxWidget(
                      imageUrl: state.productBuyerModel[index].image ?? "img",
                      productName: state.productBuyerModel[index].typeProduct ??
                          "unknowntitle",
                      productType: state.productBuyerModel[index].description ??
                          "unknown",
                      price: state.productBuyerModel[index].price ?? "unknow",
                      cashBack:
                          state.productBuyerModel[index].percentCashback ??
                              "unk",
                    ),
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 21.h);
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
