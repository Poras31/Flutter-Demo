import 'package:flutter/material.dart';

class CustomAppButton extends StatelessWidget {
  final Widget? label;
  final VoidCallback? callback;
  final ButtonStyle? buttonStyle;

  const CustomAppButton({
    this.label,
    this.callback,
    this.buttonStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: buttonStyle,
      onPressed: callback,
      child: label,
    );
  }
}
