import 'package:cashback_app/commons/date_time_extensions.dart';
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
  DateTime? _selectedDate;

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
                child: Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                  color: ThemeHelper.brown80,
                ),
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

  void _selectDate(
    BuildContext context,
  ) async {
    _selectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    );
    if (_selectedDate == null) return;

    _textEditingController
      ..text = _selectedDate!.ddMMy
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: _textEditingController.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
  }
}
