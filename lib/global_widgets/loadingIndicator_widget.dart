import 'package:flutter/material.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  const LoadingIndicatorWidget({
    Key? key,
    required this.width,
    required this.color,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: CircularProgressIndicator(
          color: color,
        ),
      ),
    );
  }
}
