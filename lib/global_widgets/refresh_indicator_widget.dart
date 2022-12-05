import 'package:flutter/material.dart';

class RefreshIndicatorWidget extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;
  final Color color;
  const RefreshIndicatorWidget({
    Key? key,
    required this.child,
    required this.onRefresh,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => onRefresh(),
      child: child,
      color: color,
    );
  }
}
