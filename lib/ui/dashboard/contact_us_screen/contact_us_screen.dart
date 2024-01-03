import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/generated/assets.dart';
import 'package:chat_ui_demo/ui/intro_screen/custom_app_button.dart';
import 'package:chat_ui_demo/ui/utils/base_app_bar.dart';
import 'package:chat_ui_demo/ui/utils/text_form_filed.dart';
import 'package:chat_ui_demo/ui/utils/validators.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/dimens.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  late ValueNotifier descriptionNotifier;
  late TextEditingController descriptionController;
  late GlobalKey<FormState> formKey;
  String? selectedValue;
  List descriptionItem = [
    "Issue First",
    "Issue Second",
    "Issue Third",
    "Issue Fourth",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBaseAppBar(),
      body: mainBody(),
    );
  }

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    descriptionController = TextEditingController();
    descriptionNotifier = ValueNotifier(false);
    super.initState();
  }

  @override
  void dispose() {
    descriptionNotifier.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  BaseAppBar buildBaseAppBar() {
    return BaseAppBar(
      title: Text(
        'Contact Us',
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
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 40,
          right: 40,
        ).r,
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            ValueListenableBuilder(
              valueListenable: descriptionNotifier,
              builder: (context, value, child) {
                return DropdownButtonFormField(
                  isExpanded: false,
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 18.0).r,
                    child: Image.asset(
                      Assets.commonDrop,
                      scale: 3.r,
                    ),
                  ),
                  validator: (value) {
                    return value == null ? 'Select issue' : null;
                  },
                  items: descriptionItem.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    selectedValue = newValue! as String?;
                    descriptionNotifier.value = selectedValue;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 20).r,
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(outLineBorderRadius).r,
                      borderSide: const BorderSide(
                        color: AppColor.textBoxFillColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColor.textBoxFillColor,
                      ),
                      borderRadius:
                          BorderRadius.circular(outLineBorderRadius).r,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColor.textBoxFillColor,
                      ),
                      borderRadius:
                          BorderRadius.circular(outLineBorderRadius).r,
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColor.textBoxFillColor,
                      ),
                      borderRadius:
                          BorderRadius.circular(outLineBorderRadius).r,
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColor.textBoxFillColor,
                      ),
                      borderRadius:
                          BorderRadius.circular(outLineBorderRadius).r,
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColor.textBoxFillColor,
                      ),
                      borderRadius:
                          BorderRadius.circular(outLineBorderRadius).r,
                    ),
                    fillColor: AppColor.textBoxFillColor,
                    filled: true,
                    hintText: 'Select issue',
                    hintStyle: hintText,
                  ),
                );
              },
            ),
            const Spacer(
              flex: 1,
            ),
            AppTextField(
              controller: descriptionController,
              maxLines: 5,
              validators: descriptionValidator,
              decoration: InputDecoration(
                counterText: "",
                hintStyle: hintText,
                hintText: 'Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40).r,
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                fillColor: AppColor.textBoxFillColor,
                filled: true,
              ),
              hint: 'Description',
            ),
            const Spacer(
              flex: 10,
            ),
            CustomAppButton(
              buttonStyle: ElevatedButton.styleFrom(
                fixedSize: Size(324.w, 52.h),
                primary: AppColor.greenColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(buttonRadius).r,
                ),
              ),
              callback: () {
                if (formKey.currentState!.validate()) {
                  // navigation to home screen
                }
              },
              label: Text(
                'Send',
                style: loginButtonText,
              ),
            ),
            const Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
