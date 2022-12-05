import 'package:cashback_app/commons/icon_images.dart';
import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/appCover_widget.dart';
import 'package:cashback_app/global_widgets/btnTryAgain_widget.dart';
import 'package:cashback_app/global_widgets/loadingIndicator_widget.dart';
import 'package:cashback_app/global_widgets/refresh_indicator_widget.dart';
import 'package:cashback_app/global_widgets/search_textfield_widget.dart';
import 'package:cashback_app/screens/buyer/screens/shop_screen/local_widgets/product_name_widget.dart';
import 'package:cashback_app/screens/seller/screens/seller_catalog_screen/catalog_screen/bloc/category_bloc.dart';
import 'package:cashback_app/screens/seller/screens/seller_catalog_screen/product_screen/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  late CategoryBloc _categoryBloc;

  @override
  void initState() {
    _categoryBloc = CategoryBloc();
    _categoryBloc.add(
      GetCategoryEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppCoverWidget(
        nameCover: 'КАТАЛОГ',
        isSeller: true,
      ),
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Column(
          children: [
            const AppCoverWidget(
              nameCover: 'КАТАЛОГ',
              isSeller: true,
            ),
            RefreshIndicatorWidget(
              onRefresh: () async => _categoryBloc.add(
                GetCategoryEvent(),
              ),
              color: ThemeHelper.brown80,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 39.h),
                  child: BlocConsumer<CategoryBloc, CategoryState>(
                    bloc: _categoryBloc,
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is LoadingCategoryState) {
                        return LoadingIndicatorWidget(
                          width: 50.w,
                          height: 50.h,
                          color: ThemeHelper.brown80,
                        );
                      }
                      if (state is LoadedCategoryState) {
                        return Column(
                          children: [
                            SearchTextFieldWidget(
                              hintText: 'Поиск',
                              prefix: ImageIcon(
                                AssetImage(IconsImages.searchIcon),
                                color: ThemeHelper.brown80,
                              ),
                              fillColor: ThemeHelper.brown20,
                              hintTextColor: ThemeHelper.brown80,
                            ),
                            SizedBox(
                              width: 1.sw,
                              height: 490.h,
                              child: GridView.builder(
                                padding: EdgeInsets.only(top: 57.h),
                                itemCount: state
                                    .categorySellerModel.listCategories!.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 80.w,
                                  mainAxisSpacing: 53.w,
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 54.h,
                                ),
                                itemBuilder: (context, index) {
                                  var category = state.categorySellerModel
                                      .listCategories![index];
                                  return Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 21.w),
                                    child: ProductNameWidget(
                                      textStyle:
                                          TextStyleHelper.productNameGreen80,
                                      borderColor: ThemeHelper.brown80,
                                      productName: category.name,
                                      function: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ProductSellerScreen(
                                              categoryId: category.id!,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      }
                      return ButtonTryAgainWidget(
                        onPressed: () => _categoryBloc.add(
                          GetCategoryEvent(),
                        ),
                        btnTheme: ThemeHelper.brown80,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
