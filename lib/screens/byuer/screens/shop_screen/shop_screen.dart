import 'package:cashback_app/commons/icon_images.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/appCover_widget.dart';
import 'package:cashback_app/global_widgets/search_textfield_widget.dart';
import 'package:cashback_app/screens/byuer/screens/shop_screen/bloc/shop_bloc.dart';
import 'package:cashback_app/screens/byuer/screens/shop_screen/local_widgets/product_name_widget.dart';
import 'package:cashback_app/screens/byuer/screens/shop_screen/local_widgets/product_info_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  late ShopBloc shopBloc;
  late bool isState;
  
  @override
  void initState() {
    shopBloc = ShopBloc();
    shopBloc.add(GetShopEvent());
    isState = true;
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
                  child: isState
                      ? GridView.builder(
                          padding: EdgeInsets.only(top: 57.h),
                          itemCount: state.catalogProductModelList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 80,
                            mainAxisSpacing: 53,
                            crossAxisCount: 2,
                            crossAxisSpacing: 54,
                          ),
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 21.w),
                            child: ProductNameWidget(
                              productName: 'Виски',
                              function: () {
                                setState(() {
                                  isState = false;
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
                          itemCount: 20,
                          itemBuilder: (context, index) =>
                              const ProductInfoBoxWidget(),
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
