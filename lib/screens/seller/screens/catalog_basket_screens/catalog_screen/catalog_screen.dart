import 'package:cashback_app/commons/icon_images.dart';
import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/appCover_widget.dart';
import 'package:cashback_app/global_widgets/search_textfield_widget.dart';
import 'package:cashback_app/screens/buyer/screens/shop_screen/local_widgets/product_name_widget.dart';
import 'package:cashback_app/screens/seller/screens/catalog_basket_screens/bloc/seller_catalog_bloc.dart';
import 'package:cashback_app/screens/seller/screens/catalog_basket_screens/product_screen/seller_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  late SellerCatalogBloc catallogSellerBloc;

  @override
  void initState() {
    catallogSellerBloc = SellerCatalogBloc();
    catallogSellerBloc.add(GetCatalogEvent());
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
            fillColor: ThemeHelper.brown20,
            hintTextColor: ThemeHelper.brown80,
            hintText: 'Поиск',
            prefix: ImageIcon(
              AssetImage(IconsImages.searchIcon),
              color: ThemeHelper.brown80,
            ),
          ),
          BlocConsumer<SellerCatalogBloc, SellerCatalogState>(
            bloc: catallogSellerBloc,
            listener: (context, state) {},
            builder: (context, state) {
              if (state is CatalogSellerLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is CatalogSellerErrorState) {
                return Center(
                  child: ElevatedButton(
                    onPressed: () => catallogSellerBloc.add(GetCatalogEvent()),
                    child: const Text('Try Again'),
                  ),
                );
              }

              if (state is CatalogSellerFetchedState) {
                return Expanded(
                    child: GridView.builder(
                  padding: EdgeInsets.only(top: 57.h),
                  itemCount: state.catalogSellerModel.length,
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
                          state.catalogSellerModel[index].name ?? 'testName',
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ProductSellerScreen()));
                        // setState(() {
                        //   ScreensState.isState = false;
                        // });
                      },
                      borderColor: Colors.white,
                      textStyle: TextStyleHelper.f12fw600,
                    ),
                  ),
                )
                    //     :
                    // ListView.separated(
                    //     padding: EdgeInsets.only(
                    //       left: 20.w,
                    //       top: 21.h,
                    //       right: 20.w,
                    //     ),
                    //     itemCount: state.catalogSellerModel.length,
                    //     itemBuilder: (context, index) => CatalogProductWidget(
                    //       imageUrl:state.catalogSellerModel[index].image ?? '',
                    //       productName: state.catalogSellerModel[index].title ?? 'unknown',
                    //       productType:
                    //           state.catalogSellerModel[index].slug ?? 'testType',
                    //       price: state.catalogSellerModel[index].price ?? 'testPrice',
                    //       cashBack: 999,
                    //     ),
                    //     separatorBuilder: (BuildContext context, int index) {
                    //       return SizedBox(height: 28.h);
                    //     },
                    //   ),
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
