import 'package:cashback_app/commons/icon_images.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/appCover_widget.dart';
import 'package:cashback_app/global_widgets/search_textfield_widget.dart';
import 'package:cashback_app/screens/seller/screens/boxOffice_screen.dart/cashBox_screen.dart';
import 'package:cashback_app/screens/seller/screens/boxOffice_screen.dart/local_widget/history_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class BoxOfficeScreen extends StatefulWidget {
  const BoxOfficeScreen({Key? key}) : super(key: key);

  @override
  State<BoxOfficeScreen> createState() => _BoxOfficeScreenState();
}

class _BoxOfficeScreenState extends State<BoxOfficeScreen> {
  late DateTime _selectedDate = DateTime.now();

  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppCoverWidget(
              nameCover: 'КАССА',
              isSeller: true,
            ),
            SizedBox(height: 22.h),
            SearchTextFieldWidget(
              controller: _textEditingController,
              hintText: 'DD/MM/YY',
              suffix: GestureDetector(
                onTap: () => _selectDate(context),
                child: Image.asset(IconsImages.iconVbrown),
              ),
              fillColor: ThemeHelper.brown20,
              hintTextColor: ThemeHelper.brown80,
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: 1.sw,
              height: 1.sh,
              child: ListView.builder(
                padding: EdgeInsets.only(
                  left: 21.w,
                  top: 30.h,
                  right: 21.w,
                ),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: HistoryButton(
                      som: 1500,
                      dateTimeBalance: '06.06.22',
                      balance: 78,
                      function: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CashBoxScreen(),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _selectDate(
    BuildContext context,
  ) async {
    DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    );
    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _textEditingController
        ..text = DateFormat('dd/MM/y').format(_selectedDate)
        ..selection = TextSelection.fromPosition(
          TextPosition(
            offset: _textEditingController.text.length,
            affinity: TextAffinity.upstream,
          ),
        );
    }
  }
}
