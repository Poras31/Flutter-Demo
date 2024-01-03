import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/dimens.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  final String hint;

  final String? prefixText, errorText, error;
  final bool obscureText;
  final TextStyle? textStyle;
  final InputDecoration? decoration;
  final TextInputAction? keyboardAction;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validators;
  final List<TextInputFormatter>? inputFormatters;
  final InputCounterWidgetBuilder? buildCounter;
  final int? maxLength;
  final Widget? prefixIcon;
  final bool enabled;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final Function()? onTap;
  final bool readOnly;
  final bool autofocus;
  final bool enableInteractiveSelection;
  final Widget? suffixIcon;
  final String? initValue;
  final FormFieldSetter<String>? onSaved;
  final bool paddingLeft;
  final EdgeInsets? contentPadding;
  final int? maxLines;
  final double? height;
  final bool filled;
  final Widget? suffix;
  final Widget? prefix;
  final ValueChanged<String>? onChanged;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final bool? isDense;
  final Color? fillColor;

  const AppTextField({
    this.error,
    this.obscureText = false,
    this.textStyle,
    this.decoration,
    this.keyboardAction,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.validators,
    this.inputFormatters,
    this.maxLength,
    this.enabled = true,
    this.controller,
    this.focusNode,
    this.nextFocusNode,
    this.onTap,
    this.readOnly = false,
    this.enableInteractiveSelection = true,
    this.suffixIcon,
    this.initValue,
    this.paddingLeft = false,
    this.contentPadding,
    this.prefixIcon,
    this.onSaved,
    this.prefixText,
    this.maxLines,
    this.height,
    this.filled = false,
    this.suffix,
    this.prefix,
    this.onChanged,
    this.errorText,
    this.buildCounter,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    this.isDense,
    super.key,
    required this.hint,
    this.fillColor,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initValue,
      onSaved: onSaved,
      cursorColor: AppColor.introNextColorWhite,
      enableInteractiveSelection: enableInteractiveSelection,
      readOnly: readOnly,
      onTap: onTap,
      controller: controller,
      focusNode: focusNode,
      enabled: enabled,
      expands: false,
      autofocus: autofocus,
      minLines: maxLines,
      maxLines: maxLines,
      style: textStyle,
      obscureText: obscureText,
      validator: validators ??
          (String? value) {
            return null;
          },
      keyboardType: keyboardType,
      textInputAction: keyboardAction,
      textCapitalization: textCapitalization,
      onChanged: onChanged,
      // onFieldSubmitted: (_) => submit(context),
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      decoration: decoration ??
          InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(outLineBorderRadius).r,
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            counterText: "",
            filled: filled,
            prefixText: prefixText,
            isDense: isDense,
            prefix: prefix,
            prefixIcon: prefixIcon,
            prefixIconConstraints: prefixIconConstraints,
            fillColor: fillColor,
            hintMaxLines: maxLines,
            suffixIcon: suffixIcon,
            suffix: suffix,
            suffixIconConstraints: suffixIconConstraints,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintStyle: hintText,
            hintText: hint,
            errorStyle: errorStyleText,
            errorMaxLines: maxLines,
            alignLabelWithHint: true,
            contentPadding: contentPadding,
          ),
    );
  }

  // void submit(BuildContext context) {
  //   switch (keyboardAction) {
  //     case TextInputAction.done:
  //       FocusScope.of(context).unfocus();
  //       break;
  //     case TextInputAction.next:
  //       FocusScope.of(context).requestFocus(nextFocusNode);
  //       break;
  //     default:
  //       FocusScope.of(context).nextFocus();
  //       break;
  //   }
  // }
}
