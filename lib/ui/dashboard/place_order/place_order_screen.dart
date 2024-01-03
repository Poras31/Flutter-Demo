import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/app_router/app_router.dart';
import 'package:chat_ui_demo/generated/assets.dart';
import 'package:chat_ui_demo/ui/intro_screen/custom_app_button.dart';
import 'package:chat_ui_demo/ui/utils/base_app_bar.dart';
import 'package:chat_ui_demo/ui/utils/text_form_filed.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/dimens.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

@RoutePage()
class PlaceOrderScreen extends StatefulWidget {
  const PlaceOrderScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  String formattedDate = DateFormat('EEE, dd MMM yyyy').format(DateTime.now());

  final ValueNotifier countVisible = ValueNotifier(true);

  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgOrderDetails,
      appBar: buildBaseAppBar(),
      body: mainBody(context),
    );
  }

  BaseAppBar buildBaseAppBar() {
    return BaseAppBar(
      title: Text(
        'Place Your Order',
        style: verificationTitle,
      ),
      elevations: 4,
      shadowColor: AppColor.baseAppBar,
      leadingWidget: InkWell(
        onTap: () {
          // navigate to back screen
          AutoRouter.of(context).pop();
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
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          4.h.verticalSpace,
          Container(
            padding: EdgeInsets.all(15).r,
            color: AppColor.greenColor.withOpacity(0.1),
            alignment: Alignment.center,
            child: Text(
              'Next delivery on $formattedDate',
              style: deliveryHuge,
            ),
          ),
          18.h.verticalSpace,
          Container(
            padding: const EdgeInsets.all(15).r,
            color: AppColor.introNextColorWhite,
            child: ValueListenableBuilder(
              valueListenable: countVisible,
              builder: (context, value, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          if (countVisible.value)
                            AppTextField(
                              hint: 'Enter Code here',
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                counterText: '',
                                hintText: 'Enter Code here',
                                hintStyle: hintText,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 0.w,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                filled: true,
                                fillColor: AppColor.introNextColorWhite,
                              ),
                            )
                          else
                            Container(
                              padding: const EdgeInsets.only(
                                left: 25,
                                right: 25,
                                top: 7,
                                bottom: 7,
                              ).r,
                              decoration: BoxDecoration(
                                color: AppColor.greenColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(4).r,
                              ),
                              child: Text(
                                'Flat20%',
                                style: deliveryHuge.copyWith(
                                  fontSize: 14.sm,
                                ),
                              ),
                            ),
                          /* countVisible.value
                              ? AppTextField(
                                  hint: 'Enter Code here',
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.zero,
                                    counterText: '',
                                    hintText: 'Enter Code here',
                                    hintStyle: hintText,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 0.w,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: AppColor.introNextColorWhite,
                                  ),
                                )
                              : Container(
                                  padding: const EdgeInsets.only(
                                    left: 25,
                                    right: 25,
                                    top: 7,
                                    bottom: 7,
                                  ).r,
                                  decoration: BoxDecoration(
                                    color: AppColor.greenColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(4).r,
                                  ),
                                  child: Text(
                                    'Flat20%',
                                    style: deliveryHuge.copyWith(
                                      fontSize: 14.sm,
                                    ),
                                  ),
                                ),*/
                          Padding(
                            padding: const EdgeInsets.only(right: 35.0).r,
                            child: countVisible.value ? dottedLine() : null,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        countVisible.value = !countVisible.value;
                      },
                      child: countVisible.value
                          ? Text(
                              'Apply',
                              style: deliveryHuge,
                            )
                          : Image.asset(
                              Assets.commonApplyClose,
                              height: 22.r,
                              width: 22.r,
                            ),
                    ),
                  ],
                );
              },
            ),
          ),
          15.h.verticalSpace,
          Container(
            decoration: BoxDecoration(
              color: AppColor.introNextColorWhite,
              borderRadius: BorderRadius.all(const Radius.circular(8).r),
              boxShadow: const [
                BoxShadow(
                  color: AppColor.introNextColorWhite,
                  blurRadius: 10,
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    bottom: 10,
                    right: 10,
                    left: 15,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Sub Total',
                                style: subTotalText,
                              ),
                              5.horizontalSpace,
                              Icon(
                                Icons.info_outline,
                                color: AppColor.greyColor,
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              Text('\$ 60.00'),
                            ],
                          ),
                        ],
                      ),
                      16.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Tax',
                                style: subTotalText,
                              ),
                              5.horizontalSpace,
                              Icon(
                                Icons.info_outline,
                                color: AppColor.greyColor,
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              Text('\$ 5.00'),
                            ],
                          ),
                        ],
                      ),
                      16.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Service Fee',
                                style: subTotalText,
                              ),
                              5.horizontalSpace,
                              Icon(
                                Icons.info_outline,
                                color: AppColor.greyColor,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '\$ 2.00',
                                style: subTotalPrice,
                              ),
                              5.horizontalSpace,
                              Text(
                                '\$ 0.00',
                                style: order,
                              ),
                            ],
                          ),
                        ],
                      ),
                      16.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Delivery Fees',
                                style: subTotalText,
                              ),
                              5.horizontalSpace,
                              Icon(
                                Icons.info_outline,
                                color: AppColor.greyColor,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '\$ 3.00',
                                style: subTotalPrice,
                              ),
                              5.horizontalSpace,
                              Text(
                                '\$ 0.00',
                                style: order,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                16.verticalSpace,
                dottedLine(),
                16.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(right: 10.0).r,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '\$ 65.00',
                      style: totalPriceText,
                    ),
                  ),
                ),
                16.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10.0).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Promo Applied (OFF20%)",
                        style: subTotalText,
                      ),
                      Text(
                        "- \$ 13.00",
                        style: discountPriceText,
                      ),
                    ],
                  ),
                ),
                7.verticalSpace,
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: 1.h,
                    width: 75.w,
                    child: Container(
                      margin: EdgeInsetsDirectional.only(end: 10.0.r),
                      color: AppColor.verticalDivider,
                    ),
                  ),
                ),
                16.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    bottom: 10,
                  ).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Amount',
                        style: totalPriceText,
                      ),
                      Text(
                        '\$ 52.00',
                        style: totalPriceText,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          ///Shipping Container
          15.verticalSpace,
          Container(
            decoration: BoxDecoration(
              color: AppColor.introNextColorWhite,
              borderRadius: BorderRadius.all(const Radius.circular(8).r),
              boxShadow: const [
                BoxShadow(
                  color: AppColor.introNextColorWhite,
                  blurRadius: 10,
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0).r,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Shipping',
                      style: order,
                    ),
                  ),
                  16.h.verticalSpace,
                  const Divider(
                    color: AppColor.verticalDivider,
                  ),
                  16.h.verticalSpace,
                  Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0).r,
                      child: Row(
                        children: [
                          Container(
                            height: 18.r,
                            width: 18.r,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.greenColor),
                            child: Container(
                              height: 6.r,
                              width: 6.r,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.introNextColorWhite,
                              ),
                            ),
                          ),
                          10.w.horizontalSpace,
                          Expanded(
                            child: Text(
                              '799 Lost Creek Road,Seattle , Fort Washington, Us, 19034',
                              style: manageAddress,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  10.h.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          //navigation to add new address screen
                          AutoRouter.of(context).push(const AddAddressRoute());
                        },
                        icon: Image.asset(
                          Assets.profileAdd,
                          width: 22.r,
                          height: 22.r,
                        ),
                        label: Text(
                          'Add New',
                          style: verificationTitle.copyWith(
                            fontSize: 16.sm,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // navigation to manage address screen
                          AutoRouter.of(context)
                              .push(const ManageAddressRoute());
                        },
                        child: Text(
                          'Manage Address',
                          style: verificationTitle.copyWith(
                            fontSize: 16.sm,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          15.h.verticalSpace,

          ///Payment information
          Container(
            decoration: BoxDecoration(
              color: AppColor.introNextColorWhite,
              borderRadius: BorderRadius.all(const Radius.circular(8).r),
              boxShadow: const [
                BoxShadow(
                  color: AppColor.introNextColorWhite,
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0).r,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Payment information',
                      style: order,
                    ),
                  ),
                  16.h.verticalSpace,
                  const Divider(
                    color: AppColor.verticalDivider,
                  ),
                  16.h.verticalSpace,
                  Card(
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0).r,
                      child: Row(
                        children: [
                          Image.asset(
                            Assets.commonMastercard,
                            height: 36.h,
                            width: 60.w,
                          ),
                          20.w.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Anthony Bailey',
                                style: deleteEdit.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              5.h.verticalSpace,
                              Text(
                                '•••• •••• •••• 5678',
                                style: deleteEdit.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          // navigation to change payment screen
                          AutoRouter.of(context)
                              .push(const ChangePaymentRoute());
                        },
                        icon: Image.asset(
                          Assets.profileAdd,
                          height: 22.r,
                          width: 22.r,
                        ),
                        label: Text(
                          'Add New',
                          style: verificationTitle.copyWith(
                            fontSize: 16.sm,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // navigation to change payment screen
                          AutoRouter.of(context)
                              .push(const ChangePaymentRoute());
                        },
                        child: Text(
                          'Change Card',
                          style: verificationTitle.copyWith(
                            fontSize: 16.sm,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          15.h.verticalSpace,
          CustomAppButton(
            callback: () {
              //navigation to success screen
              //AutoRouter.of(context).push(const SuccessRoute());
            },
            label: Text(
              'Place Order',
              style: loginButtonText,
            ),
            buttonStyle: ElevatedButton.styleFrom(
              fixedSize: Size(
                342.w,
                52.h,
              ),
              primary: AppColor.greenColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(buttonRadius).r,
              ),
            ),
          ),
          15.h.verticalSpace
        ],
      ),
    );
  }

  DottedLine dottedLine() {
    return DottedLine(
      direction: Axis.horizontal,
      lineLength: double.infinity,
      lineThickness: 1.0,
      dashLength: 4.0,
      dashColor: AppColor.greyColor,
      dashRadius: 0.0,
      dashGapLength: 1.0,
      dashGapColor: AppColor.transparent,
      dashGapRadius: 0.0,
    );
  }
}
