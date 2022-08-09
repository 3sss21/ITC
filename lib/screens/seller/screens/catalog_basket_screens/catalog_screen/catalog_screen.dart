import 'package:cashback_app/commons/icon_images.dart';
import 'package:cashback_app/commons/screens_state.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/appCover_widget.dart';
import 'package:cashback_app/global_widgets/search_textfield_widget.dart';
import 'package:cashback_app/screens/buyer/screens/shop_screen/bloc/shop_bloc.dart';
import 'package:cashback_app/screens/buyer/screens/shop_screen/local_widgets/product_name_widget.dart';
import 'package:cashback_app/screens/seller/screens/catalog_basket_screens/catalog_screen/local_widgets/catalogProducts_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  late ShopBloc shopBloc;

  @override
  void initState() {
    shopBloc = ShopBloc();
    shopBloc.add(GetShopEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppCoverWidget(nameCover: 'КАТАЛОГ'),
          SizedBox(height: 39.h),
          SearchTextFieldWidget(
            hintText: 'Поиск',
            prefix: ImageIcon(
              AssetImage(IconsImages.searchIcon),
              color: ThemeHelper.green80,
            ),
          ),
          BlocConsumer<ShopBloc, ShopState>(
            bloc: shopBloc,
            listener: (context, state) {},
            builder: (context, state) {
              if (state is LoadingShopState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is ErrorShopState) {
                return Center(
                  child: ElevatedButton(
                    onPressed: () => shopBloc.add(GetShopEvent()),
                    child: const Text('Try Again'),
                  ),
                );
              }

              if (state is LoadedShopState) {
                return Expanded(
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
                      : 
                      ListView.separated(
                          padding: EdgeInsets.only(
                            left: 20.w,
                            top: 21.h,
                            right: 20.w,
                          ),
                          itemCount: state.catalogProductModelList.length,
                          itemBuilder: (context, index) => CatalogProductWidget(
                            imageUrl:
                                'https://mykaleidoscope.ru/uploads/posts/2021-09/1632713203_1-mykaleidoscope-ru-p-kapuchino-s-shokoladom-krasivo-foto-1.jpg',
                            productName: 'Капучиноj jsdkx,cjn  jsdkx,cn k',
                            productType:
                                state.catalogProductModelList[index].name!,
                            price: 999,
                            cashBack: 999,
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
