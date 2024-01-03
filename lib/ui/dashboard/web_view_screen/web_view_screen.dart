import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/ui/dashboard/web_view_screen/web_view_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class WebViewScreen extends StatelessWidget {
  final String title;
  final String staticUrl;
  const WebViewScreen({
    super.key,
    required this.title,
    required this.staticUrl,
  });

  @override
  Widget build(BuildContext context) {
    return WebViewPage(
      webTitle: title,
      webUrl: staticUrl,
    );
  }
}
