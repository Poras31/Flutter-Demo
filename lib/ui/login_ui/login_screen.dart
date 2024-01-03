import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/app_router/app_router.dart';
import 'package:chat_ui_demo/generated/assets.dart';
import 'package:chat_ui_demo/ui/intro_screen/custom_app_button.dart';
import 'package:chat_ui_demo/ui/login_ui/country_picker.dart';
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
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController phoneNumberController;
  late GlobalKey<FormState> formKey;

  late FocusNode mobileNode;
  late ValueNotifier countryNotifire;
  late Country _selectedDialogCountry;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    countryNotifire = ValueNotifier(Country);
    _selectedDialogCountry = CountryPickerUtils.getCountryByIsoCode('IN');
    mobileNode = FocusNode();
    phoneNumberController = TextEditingController();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    countryNotifire.dispose();
    mobileNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.introNextColorWhite,
        body: mainBody(),
      ),
    );
  }

  Widget mainBody() {
    return Column(
      children: [
        const Spacer(
          flex: 2,
        ),
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            height: 118.r,
            width: 118.r,
            Assets.commonSplash,
          ),
        ),
        50.verticalSpace,
        Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.only(right: paddingLR, left: paddingLR).r,
            child: AppTextField(
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
                valueListenable: countryNotifire,
                builder: (BuildContext context, value, Widget? child) {
                  return InkWell(
                    onTap: () async => {
                      Future.delayed(Duration.zero, () {
                        mobileNode.unfocus();
                        mobileNode.canRequestFocus = false;
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
                              countryNotifire.value = country;
                              _selectedDialogCountry = country;
                            },
                          );
                        },
                      ),
                      mobileNode.canRequestFocus = true,
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: loginLeft,
                          ).r,
                          child: Text(
                            '+${_selectedDialogCountry.phoneCode}',
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
              validators: mobileValidators,
              hint: StringConstant.phoneNumber,
            ),
          ),
        ),
        12.verticalSpace,
        customAppButton(),
        const Spacer(
          flex: 3,
        ),
      ],
    );
  }

  CustomAppButton customAppButton() {
    return CustomAppButton(
      buttonStyle: ElevatedButton.styleFrom(
        fixedSize: Size(
          280.w,
          45.h,
        ),
        primary: AppColor.greenColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26.0).r,
        ),
      ),
      callback: () {
        if (formKey.currentState!.validate()) {
          // navigation to next screen
          AutoRouter.of(context).push(const VerificationRoute());
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      label: Text(
        StringConstant.loginButton,
        style: loginButtonText,
      ),
    );
  }
}
