import 'package:cashback_app/commons/icon_images.dart';
import 'package:cashback_app/commons/screens_state.dart';
import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/appCover_widget.dart';
import 'package:cashback_app/global_widgets/search_textfield_widget.dart';
import 'package:cashback_app/screens/buyer/screens/shop_screen/bloc/byuer_catalog_bloc.dart';
import 'package:cashback_app/screens/buyer/screens/shop_screen/local_widgets/product_name_widget.dart';
import 'package:cashback_app/screens/buyer/screens/shop_screen/local_widgets/product_info_box_widget.dart';
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
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is CatlaogBuyerErrorState) {
                return Center(
                  child: ElevatedButton(
                    onPressed: () => buyerCatalogBloc.add(GetCatalogEvent()),
                    child: const Text('Try Again'),
                  ),
                );
              }

              if (state is CatalogBuyerFetchedState) {
                return Expanded(
<<<<<<< HEAD
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
                                builder: (context) => BuyerProductScreen()));
                        // setState(() {
                        //   ScreensState.isState = false;
                        // });
                      },
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
=======
                  child: ScreensState.isState
                      ? GridView.builder(
                          padding: EdgeInsets.only(top: 57.h),
                          itemCount: state.catalogProductModelList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 80.w,
                            mainAxisSpacing: 53.w,
                            crossAxisCount: 2,
                            crossAxisSpacing: 54.h,
                          ),
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 21.w),
                            child: ProductNameWidget(
                              textStyle: TextStyleHelper.productNameGreen80,
                              borderColor: ThemeHelper.green50,
                              productName:
                                  state.catalogProductModelList[index].name!,
                              function: () {
                                setState(() {
                                  ScreensState.isState = false;
                                });
                              },
                            ),
                          ),
                        )
                      : ListView.separated(
                          padding: EdgeInsets.only(
                            left: 20.w,
                            top: 21.h,
                            right: 20.w,
                          ),
                          itemCount: state.catalogProductModelList.length,
                          itemBuilder: (context, index) => ProductInfoBoxWidget(
                            imageUrl:
                                'https://mykaleidoscope.ru/uploads/posts/2021-09/1632713203_1-mykaleidoscope-ru-p-kapuchino-s-shokoladom-krasivo-foto-1.jpg',
                            productName: 'Капучино',
                            productType:
                                state.catalogProductModelList[index].name!,
                            price: 999,
                            cashBack: 999,
                          ),
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: 21.h);
                          },
                        ),
                );
>>>>>>> d9d046e37d0a194d33bf2659f53c361cb03aacaf
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
