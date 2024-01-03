import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/ui/utils/base_app_bar.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String webTitle, webUrl;
  const WebViewPage({
    super.key,
    required this.webTitle,
    required this.webUrl,
  });

  @override
  State<StatefulWidget> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  bool _isLoadingPage = true;
  late final WebViewController webViewController;
  @override
  void initState() {
    _isLoadingPage = true;
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(widget.webUrl),
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text(
          widget.webTitle,
          style: verificationTitle,
        ),
        elevations: 4,
        shadowColor: AppColor.baseAppBar,
        leadingWidget: InkWell(
          onTap: () {
            //navigation to go back
            AutoRouter.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_sharp,
            color: AppColor.introTitleColorBlack,
          ),
        ),
      ),
      body: WebViewWidget(
        controller: webViewController,
      ),
    );
  }
}
