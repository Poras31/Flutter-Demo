import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/app_router/app_router.dart';
import 'package:chat_ui_demo/generated/assets.dart';
import 'package:chat_ui_demo/ui/intro_screen/custom_app_button.dart';
import 'package:chat_ui_demo/ui/utils/base_app_bar.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/dimens.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

@RoutePage()
class ViewCartScreen extends StatefulWidget {
  const ViewCartScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ViewCartScreenState();
}

class _ViewCartScreenState extends State<ViewCartScreen> {
  String formattedDate = DateFormat('EEE, dd MMM yyyy').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgOrderDetails,
      appBar: buildBaseAppBar(),
      body: mainBody(),
      bottomNavigationBar: checkOutButton(),
    );
  }

  Widget checkOutButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, right: 40.0, left: 40.0).r,
      child: CustomAppButton(
        callback: () {
          //navigation to place order screen
          AutoRouter.of(context).push(const PlaceOrderRoute());
        },
        buttonStyle: ElevatedButton.styleFrom(
          fixedSize: Size(297.w, 45.h),
          primary: AppColor.greenColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonRadius),
          ),
        ),
        label: Text(
          'Proceed to Checkout',
          style: loginButtonText,
        ),
      ),
    );
  }

  Widget mainBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          4.verticalSpace,
          Container(
            padding: const EdgeInsets.all(15).r,
            alignment: Alignment.center,
            color: AppColor.greenColor.withOpacity(0.1),
            child: Text(
              'Next delivery on $formattedDate',
              style: deliveryHuge,
            ),
          ),
          2.verticalSpace,
          Container(
            padding: const EdgeInsets.all(16).r,
            alignment: Alignment.topLeft,
            color: AppColor.greenColor.withOpacity(0.1),
            child: Text(
              'Sub Total (1 item) : \$60.00',
              style: sub,
            ),
          ),
          2.verticalSpace,
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                ),
              ],
            ),
            child: Container(
              color: AppColor.introNextColorWhite,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 15,
                  top: 15,
                ).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15).r,
                      child: Text(
                        'Walmart',
                        style: order,
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          Assets.milkLactaidFatFreePureMilk,
                          height: 100.r,
                          width: 100.r,
                        ),
                        Flexible(
                          child: Column(
                            children: [
                              20.h.verticalSpace,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Lactaid Fat Free Pure Milk',
                                    style: order.copyWith(
                                      fontSize: 15.sm,
                                    ),
                                  ),
                                  Image.asset(
                                    Assets.commonDelete,
                                    height: 16.r,
                                    width: 16.r,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  12.h.verticalSpace,
                                  Text(
                                    '\$ 15.00',
                                    style:
                                        walmartText.copyWith(fontSize: 16.sm),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '20 mg',
                                        style: address,
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              // minus calculation
                                            },
                                            icon: Image.asset(
                                              Assets.commonDecreaseIcon,
                                              height: 25.r,
                                              width: 25.r,
                                            ),
                                          ),
                                          20.w.horizontalSpace,
                                          Text(
                                            '1',
                                            style: walmartText,
                                          ),
                                          20.w.horizontalSpace,
                                          IconButton(
                                            onPressed: () {
                                              // plus calculation.
                                            },
                                            icon: Image.asset(
                                              Assets.commonAddIcon,
                                              height: 25.r,
                                              width: 25.r,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: AppColor.verticalDivider,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          Assets.milkLactaidWholePureMilk,
                          height: 100.r,
                          width: 100.r,
                        ),
                        Flexible(
                          child: Column(
                            children: [
                              20.h.verticalSpace,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Lactaid Whole Pure Milk',
                                    style: order.copyWith(
                                      fontSize: 15.sm,
                                    ),
                                  ),
                                  Image.asset(
                                    Assets.commonDelete,
                                    height: 16.r,
                                    width: 16.r,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  12.h.verticalSpace,
                                  Text(
                                    '\$ 15.00',
                                    style:
                                        walmartText.copyWith(fontSize: 16.sm),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '20 mg',
                                        style: address,
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              // minus calculation
                                            },
                                            icon: Image.asset(
                                              Assets.commonDecreaseIcon,
                                              height: 25.r,
                                              width: 25.r,
                                            ),
                                          ),
                                          20.w.horizontalSpace,
                                          Text(
                                            '1',
                                            style: walmartText,
                                          ),
                                          20.w.horizontalSpace,
                                          IconButton(
                                            onPressed: () {
                                              // plus calculation.
                                            },
                                            icon: Image.asset(
                                              Assets.commonAddIcon,
                                              height: 25.r,
                                              width: 25.r,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          4.verticalSpace,
        ],
      ),
    );
  }

  BaseAppBar buildBaseAppBar() {
    return BaseAppBar(
      title: Text(
        'View Cart',
        style: verificationTitle,
      ),
      centerTitle: true,
      elevations: 4,
      shadowColor: AppColor.baseAppBar,
      leadingWidget: Padding(
        padding: const EdgeInsets.only(
          left: 8.0,
          top: 8.0,
        ).r,
        child: InkWell(
          onTap: () {
            //navigation to old screen
            AutoRouter.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_sharp,
            color: AppColor.introTitleColorBlack,
          ),
        ),
      ),
      leadingWidth: 30.w,
    );
  }
}
