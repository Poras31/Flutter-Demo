import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/generated/assets.dart';
import 'package:chat_ui_demo/ui/dashboard/change_payment/change_payment_widget.dart';
import 'package:chat_ui_demo/ui/dashboard/change_payment/chnage_payment_model.dart';
import 'package:chat_ui_demo/ui/intro_screen/custom_app_button.dart';
import 'package:chat_ui_demo/ui/utils/base_app_bar.dart';
import 'package:chat_ui_demo/ui/utils/masked.dart';
import 'package:chat_ui_demo/ui/utils/text_form_filed.dart';
import 'package:chat_ui_demo/ui/utils/validators.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/dimens.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ChangePaymentScreen extends StatefulWidget {
  const ChangePaymentScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ChangePaymentScreenState();
}

class _ChangePaymentScreenState extends State<ChangePaymentScreen> {
  ValueNotifier<int> isSelectedNotifier = ValueNotifier(0);
  List<ChangePaymentModel> changePaymentModel = [
    ChangePaymentModel(
      cardHolderName: 'Anthony Bailey',
      cardNumber: '•••• •••• •••• 5678',
      cardImage: Assets.commonMastercard,
    ),
    ChangePaymentModel(
      cardHolderName: 'Anthony Bailey',
      cardNumber: '•••• •••• •••• 5678',
      cardImage: Assets.commonMaestro,
    ),
    ChangePaymentModel(
      cardHolderName: 'Stive Mark',
      cardNumber: '•••• •••• •••• 5678',
      cardImage: Assets.commonVisaCard,
    ),
  ];
  int isSelectedIndex = 0;

  late TextEditingController cardHolderNameController,
      cardNumberController,
      cardExpiryController,
      cardCVVController;

  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    cardHolderNameController = TextEditingController();
    cardNumberController = MaskedTextController(mask: '0000 0000 0000 0000');
    cardExpiryController = TextEditingController();
    cardCVVController = TextEditingController();
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    super.initState();
  }

  @override
  void dispose() {
    cardHolderNameController.dispose();
    cardNumberController.dispose();
    cardExpiryController.dispose();
    cardCVVController.dispose();
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
        'Manage Payment',
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
    return SingleChildScrollView(
      child: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: isSelectedNotifier,
            builder: (context, value, child) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: changePaymentModel.length,
                itemBuilder: (_, int index) {
                  final ChangePaymentModel model = changePaymentModel[index];
                  return InkWell(
                    onTap: () {
                      onSelected(index);
                    },
                    child: ChangePaymentWidget(
                      selectedIndex: isSelectedIndex,
                      index: index,
                      changePaymentModel: model,
                    ),
                  );
                },
              );
            },
          ),
          buildBottomSheet(context),
        ],
      ),
    );
  }

  void onSelected(int index) {
    isSelectedIndex = index;
    isSelectedNotifier.value = isSelectedIndex;
  }

  Widget buildBottomSheet(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          isDismissible: false,
          context: context,
          backgroundColor: AppColor.verticalDivider,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: const Radius.circular(25).r,
            ),
          ),
          builder: (context) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                decoration: BoxDecoration(
                  color: AppColor.introNextColorWhite,
                  borderRadius: BorderRadius.circular(20).r,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    25.h.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 22.0,
                      ).r,
                      child: InkWell(
                        onTap: () {
                          // navigation to go back
                          AutoRouter.of(context).pop();
                        },
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Image.asset(
                            Assets.commonClose,
                            height: 25.r,
                            width: 25.r,
                          ),
                        ),
                      ),
                    ),
                    25.h.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.only(left: 23.0).r,
                      child: Text(
                        'Add New Card',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sm,
                        ),
                      ),
                    ),
                    25.h.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 23.0,
                        right: 23.0,
                      ).r,
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 8.0).r,
                              decoration: BoxDecoration(
                                color: AppColor.payment,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(19),
                                  topRight: Radius.circular(19),
                                  bottomLeft: Radius.circular(19),
                                  bottomRight: Radius.circular(19),
                                ).r,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(19).r,
                                  color: AppColor.orderId,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppTextField(
                                      hint: 'Card Holder Name',
                                      textStyle: checkBox.copyWith(
                                        color: AppColor.paymentCard,
                                      ),
                                      contentPadding:
                                          const EdgeInsets.only(left: 25).r,
                                      controller: cardHolderNameController,
                                      validators: cardHolderNameValidator,
                                      filled: true,
                                      keyboardType: TextInputType.text,
                                      keyboardAction: TextInputAction.next,
                                    ),
                                    const Divider(
                                      color: AppColor.verticalDivider,
                                    ),
                                    AppTextField(
                                      hint: 'Card Number',
                                      maxLength: 19,
                                      textStyle: checkBox.copyWith(
                                        color: AppColor.paymentCard,
                                      ),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]'),
                                        ),
                                        LengthLimitingTextInputFormatter(
                                          19,
                                        ),
                                      ],
                                      controller: cardNumberController,
                                      validators: cardNumberValidator,
                                      contentPadding: const EdgeInsets.only(
                                        left: 25,
                                      ).r,
                                      keyboardAction: TextInputAction.next,
                                      keyboardType: TextInputType.number,
                                      filled: true,
                                    ),
                                    const Divider(
                                      color: AppColor.verticalDivider,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          flex: 3,
                                          child: AppTextField(
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            maxLength: 6,
                                            validators: cardExpireDateValidator,
                                            controller: cardExpiryController,
                                            textStyle: checkBox.copyWith(
                                              color: AppColor.paymentCard,
                                            ),
                                            contentPadding:
                                                const EdgeInsets.only(
                                              left: 25,
                                            ).r,
                                            keyboardAction:
                                                TextInputAction.next,
                                            keyboardType: TextInputType.number,
                                            filled: true,
                                            hint: 'DD / YYYY',
                                          ),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 15,
                                              vertical: 5,
                                            ).r,
                                            child: AppTextField(
                                              maxLength: 3,
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ],
                                              controller: cardCVVController,
                                              validators:
                                                  cardCVVNumberValidator,
                                              textStyle: checkBox.copyWith(
                                                color: AppColor.paymentCard,
                                              ),
                                              decoration: InputDecoration(
                                                counterText: '',
                                                errorStyle: TextStyle(
                                                  fontSize: 10.sm,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                hintStyle: checkBox.copyWith(
                                                  fontSize: 10.sm,
                                                  color: AppColor.paymentCard,
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8)
                                                          .r,
                                                  borderSide: const BorderSide(
                                                    width: 0,
                                                    style: BorderStyle.none,
                                                  ),
                                                ),
                                                fillColor: AppColor.greenColor
                                                    .withOpacity(0.3),
                                                filled: true,
                                                hintText: 'CVV',
                                              ),
                                              keyboardAction:
                                                  TextInputAction.next,
                                              keyboardType:
                                                  TextInputType.number,
                                              filled: true,
                                              hint: 'CVV',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    24.h.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 35,
                        right: 35,
                      ).r,
                      child: CustomAppButton(
                        buttonStyle: ElevatedButton.styleFrom(
                          fixedSize: Size(297.w, 52.h),
                          primary: AppColor.greenColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(buttonRadius).r,
                          ),
                        ),
                        callback: () {
                          if (formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'DOne',
                                ),
                              ),
                            );
                            AutoRouter.of(context).pop();
                            FocusManager.instance.primaryFocus?.unfocus();
                          }
                        },
                        label: Text(
                          'Add',
                          style: loginButtonText,
                        ),
                      ),
                    ),
                    3.h.verticalSpace
                  ],
                ),
              ),
            );
          },
        );
      },
      icon: Image.asset(
        Assets.profileAdd,
        height: 22.r,
        width: 22.r,
      ),
      label: Text(
        'Add New Card',
        style: verificationTitle.copyWith(
          fontSize: 16.sm,
        ),
      ),
    );
  }
}
