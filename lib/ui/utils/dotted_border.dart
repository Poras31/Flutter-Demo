import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class CustomDottedBorder extends StatelessWidget {
  final double? strokeWidth;
  final BorderType? borderType;
  final Color? color;
  final Widget? child;
  const CustomDottedBorder({
    Key? key,
    this.strokeWidth,
    this.borderType,
    this.color,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      strokeWidth: strokeWidth!,
      borderType: borderType!,
      color: color!,
      child: child!,
    );
  }
}
