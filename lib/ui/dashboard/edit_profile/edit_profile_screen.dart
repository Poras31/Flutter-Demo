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
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController phoneNumberController,
      businessNameController,
      firstNameController,
      lastNameController,
      emailAddressController,
      addressController;

  late GlobalKey<FormState> formKey;
  late ValueNotifier countryNotifier;
  late FocusNode mobileNode;
  late Country _selectDialogCountry;

  @override
  void initState() {
    _selectDialogCountry = CountryPickerUtils.getCountryByIsoCode('IN');
    mobileNode = FocusNode();
    countryNotifier = ValueNotifier(Country);
    formKey = GlobalKey<FormState>();
    phoneNumberController = TextEditingController();
    businessNameController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailAddressController = TextEditingController();
    addressController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    businessNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailAddressController.dispose();
    addressController.dispose();
    super.dispose();
  }

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
        'Edit Profile',
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
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(
          left: paddingLR,
          right: paddingLR,
        ).r,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              25.h.verticalSpace,
              AppTextField(
                hint: StringConstant.businessName,
                validators: businessNameValidator,
                controller: businessNameController,
                filled: true,
                keyboardType: TextInputType.text,
                keyboardAction: TextInputAction.next,
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
                controller: emailAddressController,
                filled: true,
                keyboardType: TextInputType.text,
                keyboardAction: TextInputAction.next,
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
                                countryNotifier.value = country;
                                _selectDialogCountry = country;
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
                              '+${_selectDialogCountry.phoneCode}',
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
                keyboardAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                filled: true,
                contentPadding: const EdgeInsets.only(
                  left: fontSizeTwelve,
                ).r,
                suffixIcon: InkWell(
                  onTap: () {
                    // navigation to location screeb
                    AutoRouter.of(context).push(const SetLocationRoute());
                  },
                  child: const Icon(
                    Icons.location_on,
                    color: AppColor.hintText,
                  ),
                ),
                controller: addressController,
                validators: addressValidator,
                hint: 'Address',
              ),
              150.verticalSpace,
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
                    //navigation to go back
                    AutoRouter.of(context).pop();
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                },
                label: Text(
                  'Update',
                  style: loginButtonText,
                ),
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
