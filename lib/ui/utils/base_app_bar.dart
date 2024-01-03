import 'package:chat_ui_demo/values/color.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? flexibleSpace;
  bool centerTitle = false;
  final Color? backgroundColor;
  final Color? shadowColor;
  final double? elevations;
  final Widget? leadingWidget;
  List<Widget>? action;
  final double? leadingWidth;

  BaseAppBar({
    Key? key,
    this.title,
    this.centerTitle = true,
    this.backgroundColor = AppColor.introNextColorWhite,
    this.elevations = 0.0,
    this.leadingWidget,
    this.preferredSize = const Size.fromHeight(kToolbarHeight),
    this.shadowColor,
    this.action,
    this.leadingWidth,
    this.flexibleSpace,
  }) : super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _BaseAppBarState createState() => _BaseAppBarState();
}

class _BaseAppBarState extends State<BaseAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: widget.flexibleSpace,
      leadingWidth: widget.leadingWidth,
      actions: widget.action,
      centerTitle: widget.centerTitle,
      title: widget.title,
      backgroundColor: widget.backgroundColor ?? AppColor.introNextColorWhite,
      elevation: widget.elevations,
      shadowColor: widget.shadowColor,
      automaticallyImplyLeading: false,
      leading: widget.leadingWidget,
    );
  }
}
