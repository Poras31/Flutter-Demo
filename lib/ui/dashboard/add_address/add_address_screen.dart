import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/app_router/app_router.dart';
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
class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  late GlobalKey<FormState> formKey;
  late TextEditingController addressController,
      unitController,
      cityController,
      stateController,
      zipcodeController,
      deliveryController;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    addressController = TextEditingController();
    unitController = TextEditingController();
    cityController = TextEditingController();
    stateController = TextEditingController();
    zipcodeController = TextEditingController();
    deliveryController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    addressController.dispose();
    unitController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipcodeController.dispose();
    deliveryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.introNextColorWhite,
      appBar: buildAppBar(),
      body: mainBody(),
    );
  }

  Widget mainBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(40.0).r,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              AppTextField(
                hint: 'Address',
                validators: addressValidator,
                controller: addressController,
                keyboardAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                filled: true,
                contentPadding: const EdgeInsets.only(left: fontSizeTwelve).r,
                suffixIcon: InkWell(
                  onTap: () {
                    //navigation to set selection route
                    AutoRouter.of(context).push(const SetLocationRoute());
                  },
                  child: const Icon(
                    Icons.location_on,
                    color: AppColor.hintText,
                  ),
                ),
              ),
              15.h.verticalSpace,
              AppTextField(
                hint: 'Enter unit number',
                validators: unitValidator,
                controller: unitController,
                keyboardAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                filled: true,
                contentPadding: const EdgeInsets.only(
                  left: fontSizeTwelve,
                ).r,
              ),
              15.h.verticalSpace,
              AppTextField(
                hint: 'City',
                validators: cityValidator,
                controller: cityController,
                keyboardAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                filled: true,
                contentPadding: const EdgeInsets.only(
                  left: fontSizeTwelve,
                ).r,
              ),
              15.h.verticalSpace,
              AppTextField(
                hint: 'State',
                validators: stateValidator,
                controller: stateController,
                keyboardAction: TextInputAction.next,
                filled: true,
                keyboardType: TextInputType.text,
                contentPadding: const EdgeInsets.only(
                  left: fontSizeTwelve,
                ).r,
              ),
              15.h.verticalSpace,
              AppTextField(
                hint: 'Zipcode',
                validators: zipCodeValidator,
                controller: zipcodeController,
                keyboardAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                filled: true,
                contentPadding: const EdgeInsets.only(
                  left: fontSizeTwelve,
                ).r,
              ),
              15.h.verticalSpace,
              AppTextField(
                hint: 'Delivery Instruction',
                validators: deliveryValidator,
                filled: true,
                controller: deliveryController,
                keyboardAction: TextInputAction.done,
                maxLines: 4,
                keyboardType: TextInputType.text,
              ),
              90.h.verticalSpace,
              CustomAppButton(
                buttonStyle: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    324.w,
                    52.h,
                  ),
                  primary: AppColor.greenColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(buttonRadius).r,
                  ),
                ),
                callback: () {
                  //check validation messages
                  if (formKey.currentState!.validate()) {
                    //manage address route
                    AutoRouter.of(context).push(const ManageAddressRoute());
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                },
                label: Text(
                  'Update',
                  style: loginButtonText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BaseAppBar buildAppBar() {
    return BaseAppBar(
      title: Text(
        'Add New Address',
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
}
