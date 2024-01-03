import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/app_router/app_router.dart';
import 'package:chat_ui_demo/ui/intro_screen/custom_app_button.dart';
import 'package:chat_ui_demo/ui/login_ui/country_picker.dart';
import 'package:chat_ui_demo/ui/utils/base_app_bar.dart';
import 'package:chat_ui_demo/ui/utils/text_form_filed.dart';
import 'package:chat_ui_demo/ui/utils/validators.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/dimens.dart';
import 'package:chat_ui_demo/values/string_constatnt.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class AddMoreDetailsScreen extends StatefulWidget {
  const AddMoreDetailsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AddMoreDetailsScreenState();
}

class _AddMoreDetailsScreenState extends State<AddMoreDetailsScreen> {
  late TextEditingController phoneNumberController,
      businessNAmeController,
      firstNameController,
      lastNameController,
      emailController,
      pincodeController;

  late GlobalKey<FormState> formKey;
  late FocusNode phoneNode;

  late final ValueNotifier<bool> valueNotifier;
  late ValueNotifier countryNotifier;
  late Country _selectCountryDialog;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    phoneNode = FocusNode();
    valueNotifier = ValueNotifier<bool>(false);
    countryNotifier = ValueNotifier(Country);
    _selectCountryDialog = CountryPickerUtils.getCountryByIsoCode('IN');
    phoneNumberController = TextEditingController();
    businessNAmeController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    pincodeController = TextEditingController();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    businessNAmeController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    pincodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.introNextColorWhite,
      appBar: baseAppBar(),
      body: mainBody(context),
    );
  }

  BaseAppBar baseAppBar() {
    return BaseAppBar(
      title: Text(
        StringConstant.addMoreDetails,
        style: verificationTitle,
      ),
      elevations: 4,
      shadowColor: AppColor.baseAppBar,
      leadingWidget: InkWell(
        onTap: () {
          //navigation to other screen
        },
        child: const Icon(
          Icons.arrow_back_ios_sharp,
          color: AppColor.introTitleColorBlack,
        ),
      ),
    );
  }

  Widget mainBody(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(39, 30, 39, 15),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            25.verticalSpace,
            AppTextField(
              hint: StringConstant.businessName,
              validators: businessNameValidator,
              controller: businessNAmeController,
              filled: true,
              keyboardType: TextInputType.text,
              keyboardAction: TextInputAction.next,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z0-9]+|\s"))
              ],
              contentPadding: const EdgeInsets.only(left: fontSizeTwelve).r,
            ),
            15.verticalSpace,
            AppTextField(
              hint: StringConstant.firstName,
              validators: firstNameValidator,
              controller: firstNameController,
              filled: true,
              keyboardType: TextInputType.text,
              keyboardAction: TextInputAction.next,
              contentPadding: const EdgeInsets.only(left: fontSizeTwelve).r,
            ),
            15.verticalSpace,
            AppTextField(
              hint: StringConstant.lastName,
              validators: lastNameValidator,
              controller: lastNameController,
              filled: true,
              keyboardType: TextInputType.text,
              keyboardAction: TextInputAction.next,
              contentPadding: const EdgeInsets.only(left: fontSizeTwelve).r,
            ),
            15.verticalSpace,
            AppTextField(
              hint: StringConstant.emailAddress,
              validators: emailValidator,
              controller: emailController,
              filled: true,
              keyboardType: TextInputType.text,
              keyboardAction: TextInputAction.next,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9@.]*')),
              ],
              contentPadding: const EdgeInsets.only(left: fontSizeTwelve).r,
            ),
            15.verticalSpace,
            AppTextField(
              keyboardAction: TextInputAction.next,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLength: 10,
              keyboardType: TextInputType.number,
              controller: phoneNumberController,
              contentPadding: const EdgeInsets.only(
                left: fontSizeTwenty,
              ).r,
              prefixIconConstraints: BoxConstraints(
                maxHeight: 25.h,
              ),
              prefixIcon: ValueListenableBuilder(
                valueListenable: countryNotifier,
                builder: (BuildContext context, value, Widget? child) {
                  return InkWell(
                    onTap: () async => {
                      Future.delayed(Duration.zero, () {
                        phoneNode.unfocus();
                        phoneNode.canRequestFocus = false;
                      }),
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CountryPicker(
                            priorityList: [
                              CountryPickerUtils.getCountryByIsoCode('US'),
                              CountryPickerUtils.getCountryByIsoCode('IN'),
                            ],
                            onValuePicked: (Country country) {
                              countryNotifier.value = country;
                              _selectCountryDialog = country;
                            },
                          );
                        },
                      ),
                      phoneNode.canRequestFocus = true,
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: loginLeft,
                          ).r,
                          child: Text(
                            '+${_selectCountryDialog.phoneCode}',
                            style: phoneText,
                          ),
                        ),
                        const VerticalDivider(
                          color: AppColor.verticalDivider,
                        ),
                      ],
                    ),
                  );
                },
              ),
              filled: true,
              validators: mobileValidator,
              hint: StringConstant.phoneNumber,
            ),
            15.verticalSpace,
            AppTextField(
              hint: StringConstant.zipCode,
              validators: pinCodeValidator,
              controller: pincodeController,
              filled: true,
              maxLength: 6,
              keyboardType: TextInputType.number,
              keyboardAction: TextInputAction.done,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              contentPadding: const EdgeInsets.only(left: fontSizeTwelve).r,
            ),
            20.verticalSpace,
            agreeCheckBox(),
            80.verticalSpace,
            customButton(),
            20.verticalSpace
          ],
        ),
      ),
    );
  }

  ValueListenableBuilder<bool> customButton() {
    return ValueListenableBuilder(
      valueListenable: valueNotifier,
      builder: (context, value, child) {
        return CustomAppButton(
          buttonStyle: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(buttonRadius).r,
            ),
            primary: AppColor.greenColor,
            fixedSize: Size(324.w, 52.h),
          ),
          callback: () {
            if (formKey.currentState?.validate() ?? false) {
              if (!valueNotifier.value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(StringConstant.acceptTnC),
                  ),
                );
              } else {
                AutoRouter.of(context).push(const DashBoardRoute());
              }
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          label: Text(
            StringConstant.addButton,
            style: loginButtonText,
          ),
        );
      },
    );
  }

  ValueListenableBuilder<bool> agreeCheckBox() {
    return ValueListenableBuilder(
      valueListenable: valueNotifier,
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Checkbox(
              value: valueNotifier.value,
              onChanged: (value) {
                valueNotifier.value = value!;
              },
              checkColor: AppColor.introNextColorWhite,
              activeColor: AppColor.greenColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(checkBoxRadius).r,
              ),
              side: !valueNotifier.value
                  ? MaterialStateBorderSide.resolveWith(
                      (states) => const BorderSide(
                        color: AppColor.checkBoxColor,
                      ),
                    )
                  : MaterialStateBorderSide.resolveWith(
                      (states) => const BorderSide(
                        color: AppColor.greenColor,
                      ),
                    ),
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: StringConstant.checkBoxAgree,
                  style: checkBox,
                  children: [
                    TextSpan(
                      text: StringConstant.tNc,
                      style: termText,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
