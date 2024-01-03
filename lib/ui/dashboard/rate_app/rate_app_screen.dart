import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/generated/assets.dart';
import 'package:chat_ui_demo/ui/intro_screen/custom_app_button.dart';
import 'package:chat_ui_demo/ui/utils/base_app_bar.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/dimens.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rating_dialog/rating_dialog.dart';

@RoutePage()
class RateAppScreen extends StatefulWidget {
  const RateAppScreen({Key? key}) : super(key: key);

  @override
  State<RateAppScreen> createState() => _RateAppScreenState();
}

class _RateAppScreenState extends State<RateAppScreen> {
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
        'Rate App',
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
    return Center(
      child: CustomAppButton(
        buttonStyle: ElevatedButton.styleFrom(
          fixedSize: Size(325.w, 52.h),
          primary: AppColor.greenColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonRadius).r,
          ),
        ),
        callback: () {
          //code to open rating dialog
          _showRatingDialogBox();
        },
        label: Text(
          'Rate',
          style: loginButtonText,
        ),
      ),
    );
  }

  void _showRatingDialogBox() {
    final ratingDialog = RatingDialog(
      title: const Text(
        'Rating Dialog In Flutter',
      ),
      onSubmitted: (ratingResponse) {
        if (ratingResponse.rating < 3.0) {
        } else {
          Container(
            height: 100,
            width: 100,
            color: Colors.amber,
          );
        }
      },
      submitButtonText: 'Submit',
      message: const Text(
        "Rating this app and tell others what you think.",
      ),
      image: Image.asset(
        Assets.profileRate,
        height: 75,
      ),
    );

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return ratingDialog;
      },
    );
  }
}
