import 'package:cashback_app/commons/icon_images.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/appCover_widget.dart';
import 'package:cashback_app/global_widgets/search_textfield_widget.dart';
import 'package:cashback_app/screens/seller/screens/boxOffice_screen.dart/local_widget/history_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoxOfficeScreen extends StatefulWidget {
  const BoxOfficeScreen({Key? key}) : super(key: key);

  @override
  State<BoxOfficeScreen> createState() => _BoxOfficeScreenState();
}

class _BoxOfficeScreenState extends State<BoxOfficeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppCoverWidget(nameCover: 'КАССА'),
            SizedBox(height: 22.h),
            SearchTextFieldWidget(
              // contentPadding: EdgeInsets.only(
              //     left: 28.0.w, top: 9.0.h, right: 15.w, bottom: 9.0.h),
              hintText: 'DD/MM/YY',
              suffix: ImageIcon(
                AssetImage(IconsImages.iconV),
                color: ThemeHelper.green80,
              ),
            ),
            SizedBox(
              width: 1.sw,
              height: 1.sh,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 21.w, top: 51.h, right: 21.w),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: HistoryButton(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
