import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/ui/utils/base_app_bar.dart';
import 'package:chat_ui_demo/ui/utils/text_form_filed.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/dimens.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

@RoutePage()
class ShareAppScreen extends StatefulWidget {
  const ShareAppScreen({Key? key}) : super(key: key);

  @override
  State<ShareAppScreen> createState() => _ShareAppScreenState();
}

class _ShareAppScreenState extends State<ShareAppScreen> {
  String text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBaseAppBar(),
      body: mainBody(),
    );
  }

  BaseAppBar buildBaseAppBar() {
    return BaseAppBar(
      title: Text(
        'Share App',
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
    );
  }

  Widget mainBody() {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextField(
                maxLines: 1,
                filled: true,
                hint: 'Enter anything to share',
                onChanged: (String value) => setState(() {
                  text = value;
                }),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                top: 12.0,
              ).r),
              Builder(
                builder: (BuildContext context) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(324.w, 52.h),
                      primary: AppColor.greenColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(buttonRadius).r,
                      ),
                    ),
                    onPressed: text.isEmpty ? null : () => _onShare(context),
                    child: Text(
                      "Share App",
                      style: loginButtonText,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onShare(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    await Share.share(
      text,
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  }
}
