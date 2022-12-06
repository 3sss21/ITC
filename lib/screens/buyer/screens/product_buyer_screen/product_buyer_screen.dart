import 'package:cashback_app/commons/icon_images.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_blocs/product_bloc/product_bloc.dart';
import 'package:cashback_app/global_widgets/appCover_widget.dart';
import 'package:cashback_app/global_widgets/loadingIndicator_widget.dart';
import 'package:cashback_app/global_widgets/refresh_indicator_widget.dart';
import 'package:cashback_app/global_widgets/search_textfield_widget.dart';
import 'package:cashback_app/screens/buyer/screens/product_buyer_screen/local_widgets/product_info_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuyerProductScreen extends StatefulWidget {
  final int categoryId;
  const BuyerProductScreen({Key? key, required this.categoryId})
      : super(key: key);

  @override
  State<BuyerProductScreen> createState() => _BuyerProductScreenState();
}

class _BuyerProductScreenState extends State<BuyerProductScreen> {
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
            isSeller: false,
            isBackButton: true,
          ),
          Expanded(
            child: RefreshIndicatorWidget(
              onRefresh: () async => _productBloc.add(
                GetProductEvent(categoryId: widget.categoryId),
              ),
              color: ThemeHelper.green80,
              child: Column(
                children: [
                  SizedBox(height: 39.h),
                  SearchTextFieldWidget(
                    hintText: 'Поиск',
                    prefix: ImageIcon(
                      AssetImage(IconsImages.searchIcon),
                      color: ThemeHelper.green80,
                    ),
                    fillColor: null,
                    hintTextColor: ThemeHelper.green80,
                  ),
                  BlocConsumer<ProductBloc, ProductState>(
                    bloc: _productBloc,
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is ProductLoadingState) {
                        return Center(
                          child: LoadingIndicatorWidget(
                            width: 50.w,
                            height: 50.h,
                            color: ThemeHelper.green80,
                          ),
                        );
                      }

                      if (state is ProductErrorState) {
                        return Center(
                          child: ElevatedButton(
                            onPressed: () => _productBloc.add(
                              GetProductEvent(categoryId: widget.categoryId),
                            ),
                            child: const Text('Try Again'),
                          ),
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
                            itemBuilder: (context, index) =>
                                ProductInfoBoxWidget(
                              imageUrl: state.listOfProduct[index].image,
                              productName: state.listOfProduct[index].title,
                              category:
                                  state.listOfProduct[index].category!.name,
                              price: state.listOfProduct[index].price,
                              cashBack:
                                  state.listOfProduct[index].percentCashback,
                            ),
                            separatorBuilder:
                                (BuildContext context, int index) {
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
            ),
          ),
        ],
      ),
    );
  }
}
