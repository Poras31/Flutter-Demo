import 'package:chat_ui_demo/values/dimens.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'IntroScreenModel.dart';

class IntroPageScreenWidget extends StatelessWidget {
  final IntroScreenModel introScreenModel;

  const IntroPageScreenWidget({Key? key, required this.introScreenModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 344.w,
          height: 241.h,
          child: Image.asset(introScreenModel.pageImage),
        ),
        40.verticalSpace,
        Text(
          introScreenModel.pageTitle,
          style: introTitleText,
        ),
        30.verticalSpace,
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: horizontal,
          ).r,
          child: Text(
            textAlign: TextAlign.center,
            introScreenModel.pageSubTitle,
            style: introSubTitleText,
          ),
        ),
      ],
    );
  }
}
