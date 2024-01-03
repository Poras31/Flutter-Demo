import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/generated/assets.dart';
import 'package:chat_ui_demo/ui/intro_screen/custom_app_button.dart';
import 'package:chat_ui_demo/ui/utils/base_app_bar.dart';
import 'package:chat_ui_demo/ui/utils/text_form_filed.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/dimens.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SetLocationScreen extends StatefulWidget {
  const SetLocationScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SetLocationScreenState();
}

class _SetLocationScreenState extends State<SetLocationScreen> {
  late TextEditingController locationController;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    locationController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(Assets.profileLocation),
        ),
      ),
      child: Scaffold(
        bottomNavigationBar: customButton(),
        backgroundColor: AppColor.transparent,
        appBar: buildAppBar(),
        body: mainBody(),
      ),
    );
  }

  Widget customButton() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10.0,
        left: 8.0,
        right: 8.0,
      ).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomAppButton(
            buttonStyle: ElevatedButton.styleFrom(
              primary: AppColor.greenColor,
              fixedSize: Size(
                255.w,
                52.h,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(buttonRadius).r,
              ),
            ),
            callback: () {
              if (formKey.currentState!.validate()) {
                //navigation to add new address screen
                AutoRouter.of(context).pop();
                FocusManager.instance.primaryFocus?.unfocus();
              }
            },
            label: Text(
              'Set',
              style: loginButtonText,
            ),
          ),
          Image.asset(
            height: 70.r,
            width: 70.r,
            Assets.profileLocationCircle,
          ),
        ],
      ),
    );
  }

  BaseAppBar buildAppBar() {
    return BaseAppBar(
      title: Text(
        'Set Location',
        style: verificationTitle,
      ),
      elevations: 2,
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 18,
            left: 24,
            right: 24,
          ),
          child: Form(
            key: formKey,
            child: Align(
              alignment: Alignment.topCenter,
              child: AppTextField(
                decoration: InputDecoration(
                  counterText: "",
                  hintStyle: hintText,
                  hintText: '3153 Abia Martin Drive, Washington',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40).r,
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  fillColor: AppColor.introNextColorWhite,
                  filled: true,
                ),
                keyboardAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                filled: true,
                contentPadding: const EdgeInsets.all(15).r,
                controller: locationController,
                hint: '3153 Abia Martin Drive, Washington',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
