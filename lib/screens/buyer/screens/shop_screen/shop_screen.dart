import 'package:cashback_app/commons/icon_images.dart';
import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/appCover_widget.dart';
import 'package:cashback_app/global_widgets/btnTryAgain_widget.dart';
import 'package:cashback_app/global_widgets/loadingIndicator_widget.dart';
import 'package:cashback_app/global_widgets/search_textfield_widget.dart';
import 'package:cashback_app/screens/buyer/screens/shop_screen/bloc/byuer_catalog_bloc.dart';
import 'package:cashback_app/screens/buyer/screens/shop_screen/local_widgets/product_name_widget.dart';
import 'package:cashback_app/screens/buyer/screens/shop_screen/product_buyer_screen/product_buyer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  late BuyerCatalogBloc buyerCatalogBloc;

  @override
  void initState() {
    buyerCatalogBloc = BuyerCatalogBloc();
    buyerCatalogBloc.add(GetCatalogEvent());
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
            fillColor: ThemeHelper.green20,
            hintTextColor: ThemeHelper.green80,
            hintText: 'Поиск',
            prefix: ImageIcon(
              AssetImage(IconsImages.searchIcon),
              color: ThemeHelper.green80,
            ),
          ),
          BlocConsumer<BuyerCatalogBloc, BuyerCatalogState>(
            bloc: buyerCatalogBloc,
            listener: (context, state) {},
            builder: (context, state) {
              if (state is CatalogBuyerLoadingState) {
                return const LoadingIndicatorWidget();
              }

              if (state is CatlaogBuyerErrorState) {
                return ButtonTryAgainWidget(
                  onTabFunction: () => buyerCatalogBloc.add(
                    GetCatalogEvent(),
                  ),
                  btnTheme: ThemeHelper.green80,
                );
              }

              if (state is CatalogBuyerFetchedState) {
                return Expanded(
                    child: GridView.builder(
                  padding: EdgeInsets.only(top: 57.h),
                  itemCount: state.catalogBuyerModel.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 80.w,
                    mainAxisSpacing: 53.w,
                    crossAxisCount: 2,
                    crossAxisSpacing: 54.h,
                  ),
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21.w),
                    child: ProductNameWidget(
                      productName:
                          state.catalogBuyerModel[index].name ?? "ubkwe",
                      function: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BuyerProductScreen(),
                          ),
                        );
                        // setState(() {
                        //   ScreensState.isState = false;
                        // });
                      },
                      borderColor: ThemeHelper.green50,
                      textStyle: TextStyleHelper.productNameGreen80,
                    ),
                  ),
                )
                    //       : ListView.separated(
                    //           padding: EdgeInsets.only(
                    //             left: 20.w,
                    //             top: 21.h,
                    //             right: 20.w,
                    //           ),
                    //           itemCount: state.catalogBuyerModel.length,
                    //          itemBuilder: (context, index) => ProductInfoBoxWidget(
                    //             imageUrl:
                    //                 'https://mykaleidoscope.ru/uploads/posts/2021-09/1632713203_1-mykaleidoscope-ru-p-kapuchino-s-shokoladom-krasivo-foto-1.jpg',
                    //             productName: 'Капучино',
                    //             productType:
                    //                 state.catalogBuyerModel[index].name??"unknown",
                    //             price: 999,
                    //             cashBack: 999,
                    //           ),
                    //           separatorBuilder: (BuildContext context, int index) {
                    //             return SizedBox(height: 21.h);
                    //           },
                    //         ),
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
