import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/app_router/app_router.dart';
import 'package:chat_ui_demo/ui/intro_screen/custom_app_button.dart';
import 'package:chat_ui_demo/ui/utils/base_app_bar.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/dimens.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class MyOrderScreen extends StatefulWidget {
  //final Function isBackPressed;
  const MyOrderScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MyOrderDetailsScreenState();
}

class _MyOrderDetailsScreenState extends State<MyOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgOrderDetails,
      appBar: buildBaseAppBar(),
      body: mainBody(),
    );
  }

  BaseAppBar buildBaseAppBar() {
    return BaseAppBar(
      title: Text(
        'My Orders',
        style: verificationTitle,
      ),
      elevations: 4,
      shadowColor: AppColor.baseAppBar,
      leadingWidget: InkWell(
        onTap: () {
          //navigation to go back
          // AutoRouter.of(context).popUntilRoot();
          //widget.isBackPressed;
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
      child: Padding(
        padding: const EdgeInsets.all(15.0).r,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                //navigation to order details screen
                AutoRouter.of(context).push(const MyOrderDetailsRoute());
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0).r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Order Id : ABC1234',
                            style: order,
                          ),
                          Text(
                            'Order Placed',
                            style: orderPlaced,
                          ),
                        ],
                      ),
                      10.h.verticalSpace,
                      Text(
                        '25 Feb, 2019 • 3:00 pm',
                        style: orderTime.copyWith(
                          fontSize: 15.sm,
                        ),
                      ),
                      10.h.verticalSpace,
                      Row(
                        children: [
                          Text(
                            'Total Items:',
                            style: orderTime.copyWith(
                              fontSize: 15.sm,
                            ),
                          ),
                          Text(
                            ' 4',
                            style: order.copyWith(
                              fontSize: 15.sm,
                            ),
                          ),
                        ],
                      ),
                      10.h.verticalSpace,
                      Text(
                        '\$ 52.00',
                        style: totalAmount,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order Id : ABC1234',
                          style: order,
                        ),
                        Text(
                          'Delivered',
                          style: orderPlaced.copyWith(
                            color: AppColor.greenColor,
                          ),
                        ),
                      ],
                    ),
                    10.h.verticalSpace,
                    Text(
                      '25 Feb, 2019 • 3:00 pm',
                      style: orderTime,
                    ),
                    10.h.verticalSpace,
                    Row(
                      children: [
                        Text(
                          'Total Items:',
                          style: orderTime.copyWith(
                            fontSize: 15.sm,
                          ),
                        ),
                        Text(
                          ' 4',
                          style: order.copyWith(
                            fontSize: 14.sm,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$ 52.00',
                          style: totalAmount,
                        ),
                        customAppButton(),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order Id : ABC1234',
                          style: order,
                        ),
                        Text(
                          'On The Way',
                          style: onTheWay,
                        ),
                      ],
                    ),
                    10.h.verticalSpace,
                    Text(
                      '25 Feb, 2019 • 3:00 pm',
                      style: orderTime,
                    ),
                    10.h.verticalSpace,
                    Row(
                      children: [
                        Text(
                          'Total Items:',
                          style: orderTime.copyWith(
                            fontSize: 15.sm,
                          ),
                        ),
                        Text(
                          ' 4',
                          style: order.copyWith(
                            fontSize: 14.sm,
                          ),
                        )
                      ],
                    ),
                    10.h.verticalSpace,
                    Text(
                      '\$ 52.00',
                      style: totalAmount,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customAppButton() {
    return CustomAppButton(
      callback: () {
        // click event for button
      },
      label: Text(
        'Reorder',
        style: loginButtonText,
      ),
      buttonStyle: ElevatedButton.styleFrom(
        fixedSize: Size(93.w, 32.h),
        primary: AppColor.greenColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonRadius).r,
        ),
      ),
    );
  }
}
