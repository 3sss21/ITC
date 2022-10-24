import 'package:cashback_app/commons/icon_images.dart';
import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/appCover_widget.dart';
import 'package:cashback_app/global_widgets/btnTryAgain_widget.dart';
import 'package:cashback_app/global_widgets/loadingIndicator_widget.dart';
import 'package:cashback_app/global_widgets/search_textfield_widget.dart';
import 'package:cashback_app/screens/buyer/screens/shop_screen/local_widgets/product_name_widget.dart';
import 'package:cashback_app/screens/seller/screens/seller_catalog_screen/bloc/seller_catalog_bloc.dart';
import 'package:cashback_app/screens/seller/screens/seller_catalog_screen/product_screen/seller_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  void updateList(String value) {}

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
      body: Column(children: [
        const AppCoverWidget(
          nameCover: 'КАТАЛОГ',
          isSeller: true,
        ),
        SizedBox(
          height: 39.h,
        ),
        TextField(
          style: TextStyleHelper.f14fw500,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromRGBO(83, 42, 42, 0.2),
            hintText: "Поиск",
            prefixIcon: Icon(Icons.search_sharp),
            prefixIconColor: ThemeHelper.brown80,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.only(top: 57.h),
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 80.w,
              mainAxisSpacing: 53.w,
              crossAxisCount: 2,
              crossAxisSpacing: 54.h,
            ),
            itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 21.w),
                child: ProductNameWidget(
                  textStyle: TextStyleHelper.productNameGreen80,
                  borderColor: ThemeHelper.brown80,
                    productName:
                        // state.catalogSellerModel[index].name ??
                        'testName',
                    function: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductSellerScreen(),
                        ),
                      );
                    })),
          ),
        ),
      ]),
    );
  }
}
   
    //     body: SizedBox(
    //       width: 1.sw,
    //       height: 1.sh,
    //       child: Center(
    //         child: Stack(children: <Widget>[
    //           Container(
    //             child: Column(
    //               children: [
    //                 const AppCoverWidget(
    //                   nameCover: 'КАТАЛОГ',
    //                   isSeller: true,
    //                 ),
    //                 SizedBox(height: 39.h),
    //                 BlocConsumer<SellerCatalogBloc, SellerCatalogState>(
    //                   bloc: catallogSellerBloc,
    //                   listener: (context, state) {},
    //                   builder: (context, state) {
    //                     if (state is CatalogSellerLoadingState) {
    //                       return const LoadingIndicatorWidget(
    //                         isSeller: true,
    //                       );
    //                     }

    //                     if (state is CatalogSellerErrorState) {
    //                       return Center(
    //                         child: ButtonTryAgainWidget(
    //                           onTabFunction: () => catallogSellerBloc.add(
    //                             GetCatalogEvent(),
    //                           ),
    //                           btnTheme: ThemeHelper.brown50,
    //                         ),
    //                       );
    //                     }

    //                     if (state is CatalogSellerFetchedState) {
    //                       return Expanded(
    //                           child: GridView.builder(
    //                         padding: EdgeInsets.only(top: 57.h),
    //                         itemCount: state.catalogSellerModel.length,
    //                         gridDelegate:
    //                             SliverGridDelegateWithFixedCrossAxisCount(
    //                           mainAxisExtent: 80.w,
    //                           mainAxisSpacing: 53.w,
    //                           crossAxisCount: 2,
    //                           crossAxisSpacing: 54.h,
    //                         ),
    //                         itemBuilder: (context, index) => Padding(
    //                           padding: EdgeInsets.symmetric(horizontal: 21.w),
    //                           child: ProductNameWidget(
    //                             productName:
    //                                 state.catalogSellerModel[index].name ??
    //                                     'testName',
    //                             function: () {
    //                               Navigator.push(
    //                                 context,
    //                                 MaterialPageRoute(
    //                                   builder: (context) =>
    //                                       const ProductSellerScreen(),
    //                                 ),
    //                               );
    //                             },
    //                             borderColor: Colors.white,
    //                             textStyle: TextStyleHelper.f12fw600,
    //                           ),
    //                         ),
    //                       ));
    //                     }
    //                     return const SizedBox();
    //                   },
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Padding(
    //             padding: EdgeInsets.only(top: 178.h, left: 20.w, right: 20.w),
    //             child: Container(
    //               child: SearchTextFieldWidget(
    //                 fillColor: ThemeHelper.brown20,
    //                 hintTextColor: ThemeHelper.brown80,
    //                 hintText: 'Поиск',
    //                 prefix: ImageIcon(
    //                   AssetImage(IconsImages.searchIcon),
    //                   color: ThemeHelper.brown80,
    //                 ),
    //               ),
    //             ),
    //           )
    //         ]),
    //       ),
    //     ),
    //   );
    // }
  
