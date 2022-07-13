
import 'package:cashback_app/screens/seller/shop/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../byuer/shop/katalog2.dart';
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
   catalogBloc =CatalogBloc();
   catalogBloc.add(GetPeoductEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Color.fromRGBO(23, 69, 59, 0.8),
          title: const Text(
            '      КАТАЛОГ',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          centerTitle: false,
          actions: [
            Image.asset("assets/images/feliz_logo.png"),
            SizedBox(
              width: 20.w,
              child: Text(""),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      body: BlocConsumer<CatalogBloc, CatalogState>(
        bloc: catalogBloc,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Column(children: [
            SizedBox(
              height: 39.h,
            ),
            SearchField(),
            Padding(
              padding: const EdgeInsets.only(
                left: 21,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 57.h,
                        width: 21.w,
                      ),
                      const CatalogButton(
                        titleOfCatalog: "Koфе",
                      ),
                      SizedBox(height: 53.h),
                      const CatalogButton(
                        titleOfCatalog: "Koфе",
                      ),
                      SizedBox(height: 53.h),
                      const CatalogButton(
                        titleOfCatalog: "Koфе",
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 57.h,
                        width: 21.w,
                      ),
                      const CatalogButton(
                        titleOfCatalog: "Лимонады",
                      ),
                      SizedBox(height: 53.h),
                      const CatalogButton(
                        titleOfCatalog: "Лимонады",
                      ),
                      SizedBox(height: 53.h),
                      const CatalogButton(
                        titleOfCatalog: "Лимонады",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]);
        },
      ),
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

class CatalogButton extends StatelessWidget {
  final String titleOfCatalog;
  const CatalogButton({
    required this.titleOfCatalog,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(140.w, 80.h),
        maximumSize: Size(140.w, 80.h),
        primary: const Color.fromRGBO(255, 255, 255, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> CatProductBuyer()));
      },
      child: Text(
        titleOfCatalog,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(23, 69, 59, 0.8),
        ),
      ),
    );
  }
}
