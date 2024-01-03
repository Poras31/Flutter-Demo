import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/app_router/app_router.dart';
import 'package:chat_ui_demo/ui/intro_screen/custom_app_button.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/dimens.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColor.greenColor,
      bottomNavigationBar: bottomCustomButton(context),
      body: mainBody(),
    );
  }

  Widget bottomCustomButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0).r,
      child: CustomAppButton(
        buttonStyle: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonRadius).r,
          ),
          primary: AppColor.introNextColorWhite,
          fixedSize: Size(324.w, 52.h),
        ),
        callback: () {
          // navigation to dashboard screen
          AutoRouter.of(context).replaceAll([const DashBoardRoute()]);
        },
        label: Text(
          'Back to Home',
          style: introNextGoButtonText.copyWith(
              fontSize: 16.sm, color: AppColor.greenColor),
        ),
      ),
    );
  }

  Widget mainBody() {
    return Column(
      children: [
        const Spacer(
          flex: 8,
        ),
        Center(
          child: Container(
            height: 235.r,
            width: 235.r,
            decoration: BoxDecoration(
              color: AppColor.introNextColorWhite.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(35.0).r,
              child: Container(
                padding: const EdgeInsets.all(35.0).r,
                height: 135.r,
                width: 135.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.introNextColorWhite.withOpacity(0.2),
                ),
                child: Container(
                  height: 110.r,
                  width: 110.r,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.introNextColorWhite,
                  ),
                  child: Icon(
                    Icons.done,
                    size: 60.r,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          ),
        ),
        46.h.verticalSpace,
        Text(
          'Success',
          style: introNextGoButtonText.copyWith(
            fontSize: 24.sm,
          ),
        ),
        25.h.verticalSpace,
        Text(
          'Your order has been successfully placed!',
          style: order.copyWith(
            color: AppColor.introNextColorWhite,
          ),
        ),
        25.h.verticalSpace,
        Text(
          'Order ID : ABCD123456',
          style: introNextGoButtonText.copyWith(
            fontSize: 16.sm,
          ),
        ),
        const Spacer(
          flex: 6,
        ),
      ],
    );
  }
}
