import 'package:cashback_app/commons/icon_images.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_blocs/product_bloc/product_bloc.dart';
import 'package:cashback_app/global_widgets/appCover_widget.dart';
import 'package:cashback_app/global_widgets/btnTryAgain_widget.dart';
import 'package:cashback_app/global_widgets/loadingIndicator_widget.dart';
import 'package:cashback_app/global_widgets/search_textfield_widget.dart';
import 'package:cashback_app/screens/seller/screens/seller_catalog_screen/catalog_screen/local_widgets/catalogProducts_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductSellerScreen extends StatefulWidget {
  final int categoryId;
  const ProductSellerScreen({Key? key, required this.categoryId})
      : super(key: key);

  @override
  State<ProductSellerScreen> createState() => _ProductSellerScreenState();
}

class _ProductSellerScreenState extends State<ProductSellerScreen> {
  late ProductBloc _productBloc;

  @override
  void initState() {
    _productBloc = ProductBloc();
    _productBloc.add(GetProductEvent(categoryId: widget.categoryId));
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
            isBackButton: true,
          ),
          SizedBox(height: 39.h),
          SearchTextFieldWidget(
            hintText: 'Поиск',
            prefix: ImageIcon(
              AssetImage(IconsImages.searchIcon),
              color: ThemeHelper.brown80,
            ),
            fillColor: ThemeHelper.brown20,
            hintTextColor: ThemeHelper.brown80,
          ),
          BlocConsumer<ProductBloc, ProductState>(
            bloc: _productBloc,
            listener: (context, state) {},
            builder: (context, state) {
              // if (state is ProductLoadingState) {
              //   return const LoadingIndicatorWidget(
              //     isSeller: true,
              //   );
              // }

              if (state is ProductErrorState) {
                return ButtonTryAgainWidget(
                  onPressed: () => _productBloc.add(
                    GetProductEvent(categoryId: widget.categoryId),
                  ),
                  btnTheme: ThemeHelper.brown80,
                );
              }

              if (state is ProductFetchedState) {
                return Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.only(
                      left: 20.w,
                      top: 21.h,
                      right: 20.w,
                    ),
                    itemCount: state.listOfProduct.length,
                    itemBuilder: (context, index) {
                      var product = state.listOfProduct[index];
                      return CatalogProductWidget(
                        imageUrl: product.image,
                        productName: product.title,
                        productType: product.category!.name,
                        price: product.price,
                        cashBack: product.percentCashback.toString(),
                      );
                    },
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
