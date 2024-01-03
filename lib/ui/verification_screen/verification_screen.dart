import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/app_router/app_router.dart';
import 'package:chat_ui_demo/generated/assets.dart';
import 'package:chat_ui_demo/ui/intro_screen/custom_app_button.dart';
import 'package:chat_ui_demo/ui/utils/base_app_bar.dart';
import 'package:chat_ui_demo/ui/utils/validators.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/dimens.dart';
import 'package:chat_ui_demo/values/string_constatnt.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

@RoutePage()
class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<StatefulWidget> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  late TextEditingController verificationController;
  int pinLength = 4;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    verificationController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    verificationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.introNextColorWhite,
      appBar: baseAppBar(),
      body: mainBody(),
    );
  }

  BaseAppBar baseAppBar() {
    return BaseAppBar(
      title: Text(
        StringConstant.verificationCode,
        style: verificationTitle,
      ),
      elevations: 4,
      shadowColor: AppColor.baseAppBar,
      leadingWidget: InkWell(
        onTap: () {
          //navigation to previous screen
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
      child: Column(
        children: [
          90.verticalSpace,
          Padding(
            padding:
                const EdgeInsets.only(left: buttonRadius, right: buttonRadius)
                    .r,
            child: Center(
              child: Column(
                children: [
                  Text(
                    StringConstant.verificationFirst,
                    style: verificationDetails,
                  ),
                  3.verticalSpace,
                  Text(
                    StringConstant.verificationSecond,
                    style: verificationDetails,
                  ),
                  3.verticalSpace,
                  Text(
                    StringConstant.verificationThird,
                    style: verificationDetails,
                  ),
                ],
              ),
            ),
          ),
          20.verticalSpace,
          putPinVerificationBox(),
          72.verticalSpace,
          customAppButton(),
          45.verticalSpace,
          resend(),
          70.verticalSpace,
          Image.asset(
            Assets.commonVerification,
            height: 118.r,
            width: 118.r,
          ),
          50.verticalSpace
        ],
      ),
    );
  }

  Widget resend() {
    return InkWell(
      onTap: () {
        verificationController.clear();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Text(
        StringConstant.reSendCode,
        style: resendText,
      ),
    );
  }

  CustomAppButton customAppButton() {
    return CustomAppButton(
      buttonStyle: ElevatedButton.styleFrom(
        fixedSize: Size(297.w, 45.h),
        primary: AppColor.greenColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonRadius).r),
      ),
      callback: () {
        if (formKey.currentState?.validate() ?? false) {
          AutoRouter.of(context).push(const AddMoreDetailsRoute());
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(StringConstant.enterVerificationCode),
            ),
          );
        }
      },
      label: const Text(StringConstant.verificationButton),
    );
  }

  Form putPinVerificationBox() {
    return Form(
      key: formKey,
      child: Pinput(
        controller: verificationController,
        preFilledWidget: const Text("-"),
        keyboardType: TextInputType.number,
        closeKeyboardWhenCompleted: true,
        autofocus: true,
        inputFormatters: [
          FilteringTextInputFormatter(
            RegExp(r'[0-9]'),
            allow: true,
          ),
        ],
        defaultPinTheme: PinTheme(
          width: 60.r,
          height: 60.r,
          textStyle: verificationDetails,
          margin: const EdgeInsets.all(margin).r,
          decoration: BoxDecoration(
              color: AppColor.textBoxFillColor,
              shape: BoxShape.circle,
              border: Border.all(color: AppColor.pinPutBorder)),
        ),
        validator: verificationValidator,
      ),
    );
  }
}
