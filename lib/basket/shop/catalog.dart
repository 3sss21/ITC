import 'package:cashback_app/basket/shop/product.dart';
import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/catalog_bloc.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  late CatalogBloc catalogBloc;

  @override
  void initState() {
    catalogBloc = CatalogBloc();
    catalogBloc.add(GetAllProductsEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          backgroundColor: const Color.fromRGBO(23, 69, 59, 0.8),
          title: Text(
            '      КАТАЛОГ',
            textAlign: TextAlign.center,
            style: TextStyleHelper.medium18,
          ),
          centerTitle: false,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Image.asset("assets/images/feliz_logo.png"),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
      ),
      body: BlocConsumer<CatalogBloc, CatalogState>(
        bloc: catalogBloc,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is CatalogLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CatalogErrorState) {}

          if (state is CatalogterFetchedState) {
            return Column(
              children: [
                SizedBox(height: 39.h),
                const SearchField(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 21,
                      right: 20,
                      top: 57,
                    ),
                    child: GridView.builder(
                      itemCount: state.catalogList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 80,
                        crossAxisSpacing: 54,
                        mainAxisSpacing: 53,
                      ),
                      itemBuilder: (context, index) => Container(
                        width: 140.w,
                        height: 5.h,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductScreen()));
                          },
                          child: CatalogCard(
                            title: state.catalogList[index].name ?? 'unknown',
                          ),
                        ),
                      ),
                    ),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Column(
                    //       children: [
                    //         SizedBox(
                    //           height: 57.h,
                    //           width: 21.w,
                    //         ),
                    //         const CatalogButton(
                    //           titleOfCatalog: "Koфе",
                    //         ),
                    //         SizedBox(height: 53.h),
                    //         const CatalogButton(
                    //           titleOfCatalog: "Koфе",
                    //         ),
                    //         SizedBox(height: 53.h),
                    //         const CatalogButton(
                    //           titleOfCatalog: "Koфе",
                    //         ),
                    //       ],
                    //     ),
                    //     Column(
                    //       children: [
                    //         SizedBox(
                    //           height: 57.h,
                    //           width: 21.w,
                    //         ),
                    //         const CatalogButton(
                    //           titleOfCatalog: "Лимонады",
                    //         ),
                    //         SizedBox(height: 53.h),
                    //         const CatalogButton(
                    //           titleOfCatalog: "Лимонады",
                    //         ),
                    //         SizedBox(height: 53.h),
                    //         const CatalogButton(
                    //           titleOfCatalog: "Лимонады",
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                  ),
                ),
              ],
            );
          }

          return const SizedBox();
        },
      ),
      // bottomNavigationBar: CustomBottomNavigator(currentPage: 2),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 334.w,
      height: 38.h,
      child: TextField(
          style: const TextStyle(
            fontSize: 25.0,
            color: Color.fromRGBO(23, 69, 59, 0.8),
          ),
          decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromRGBO(23, 69, 59, 0.2),
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              prefixIcon: IconButton(
                icon: const Icon(
                  Icons.search_rounded,
                  color: Color.fromRGBO(23, 69, 59, 0.8),
                ),
                onPressed: () {},
              ),
              hintText: "Поиск",
              hintStyle: TextStyle(
                  color: Color.fromRGBO(23, 69, 59, 0.8), fontSize: 20),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 32.0),
                  borderRadius: BorderRadius.circular(25.0)),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromRGBO(23, 69, 59, 0.8)),
                  borderRadius: BorderRadius.circular(25.0)))),
    );
  }
}

class CatalogCard extends StatelessWidget {
  final String title;

  const CatalogCard({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,

      height: 140,
      width: 80,
      child: Text(title),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: const[
      BoxShadow(
        color: Color.fromRGBO(23, 69, 59, 0.25),
        spreadRadius: 4,
        blurRadius: 10,
        offset: Offset(1, 1), // changes position of shadow
      ),
    ],
      ),
    );
  }
}
