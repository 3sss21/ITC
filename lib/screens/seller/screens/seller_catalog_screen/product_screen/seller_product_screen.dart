import 'package:cashback_app/commons/icon_images.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/appCover_widget.dart';
import 'package:cashback_app/global_widgets/btnTryAgain_widget.dart';
import 'package:cashback_app/global_widgets/loadingIndicator_widget.dart';
import 'package:cashback_app/global_widgets/search_textfield_widget.dart';
import 'package:cashback_app/screens/seller/screens/seller_catalog_screen/catalog_screen/local_widgets/catalogProducts_widget.dart';
import 'package:cashback_app/screens/seller/screens/seller_catalog_screen/product_screen/bloc/product_bloc.dart';
import 'package:cashback_app/screens/seller/seller_navigation/seller_navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductSellerScreen extends StatefulWidget {
  const ProductSellerScreen({Key? key}) : super(key: key);

  @override
  State<ProductSellerScreen> createState() => _ProductSellerScreenState();
}

class _ProductSellerScreenState extends State<ProductSellerScreen> {
  late ProductBloc productBloc;

  @override
  void initState() {
    productBloc = ProductBloc();
    productBloc.add(GetProductEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppCoverWidget(
            nameCover: 'КАТАЛОГ',
            isSeller: true,
          ),
          SizedBox(height: 39.h),
          SearchTextFieldWidget(
            hintText: 'Поиск',
            prefix: ImageIcon(
              AssetImage(IconsImages.searchIcon),
              color: ThemeHelper.green80,
            ),
            fillColor: null,
            hintTextColor: Colors.white,
          ),
          BlocConsumer<ProductBloc, ProductState>(
            bloc: productBloc,
            listener: (context, state) {},
            builder: (context, state) {
              if (state is ProductSellerLoadingState) {
                return const LoadingIndicatorWidget(
                  isSeller: true,
                );
              }

              if (state is ProductSellerErrorState) {
                return ButtonTryAgainWidget(
                  onTabFunction: () => productBloc.add(GetProductEvent()),
                  btnTheme: ThemeHelper.brown80,
                );
              }

              if (state is ProductSellerFetchedState) {
                return Expanded(
                  child:
                      //      GridView.builder(
                      //   padding: EdgeInsets.only(top: 57.h),
                      //   itemCount: state.productSellerModel.length,
                      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //     mainAxisExtent: 80.w,
                      //     mainAxisSpacing: 53.w,
                      //     crossAxisCount: 2,
                      //     crossAxisSpacing: 54.h,
                      //   ),
                      //   itemBuilder: (context, index) => Padding(
                      //     padding: EdgeInsets.symmetric(horizontal: 21.w),
                      //     child: ProductNameWidget(
                      //       productName:
                      //           state.catalogSellerModel[index].name ?? 'testName',
                      //       function: () {
                      //         // setState(() {
                      //         //   ScreensState.isState = false;
                      //         // });
                      //       },
                      //     ),
                      //   ),
                      // )
                      //     :
                      ListView.separated(
                    padding: EdgeInsets.only(
                      left: 20.w,
                      top: 21.h,
                      right: 20.w,
                    ),
                    itemCount: state.productSellerModel.length,
                    itemBuilder: (context, index) => CatalogProductWidget(
                      imageUrl: state.productSellerModel[index].image ?? '',
                      productName:
                          state.productSellerModel[index].category ?? 'unknown',
                      productType:
                          state.productSellerModel[index].slug ?? 'testType',
                      price:
                          state.productSellerModel[index].price ?? 'testPrice',
                      cashBack: state.productSellerModel[index].percentCashback
                          .toString(),
                    ),
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 28.h);
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
