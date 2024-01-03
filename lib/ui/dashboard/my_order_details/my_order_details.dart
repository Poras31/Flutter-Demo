import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/app_router/app_router.dart';
import 'package:chat_ui_demo/generated/assets.dart';
import 'package:chat_ui_demo/ui/utils/base_app_bar.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/dimens.dart';
import 'package:chat_ui_demo/values/string_constatnt.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class MyOrderDetailsScreen extends StatefulWidget {
  const MyOrderDetailsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MyOrderDetailsScreenState();
}

class _MyOrderDetailsScreenState extends State<MyOrderDetailsScreen> {
  int totalDots = 8;

  final decorator = DotsDecorator(
    shape: const Border(),
    activeColor: AppColor.greenColor,
    size: const Size.square(3.0),
    spacing: const EdgeInsets.only(
      top: 1,
      bottom: 1,
      left: 8,
    ).r,
    color: AppColor.greenColor,
    activeSize: const Size.square(0.0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgOrderDetails,
      appBar: buildBaseAppBar(),
      body: mainBody(decorator),
    );
  }

  BaseAppBar buildBaseAppBar() {
    return BaseAppBar(
      title: Text(
        'Order Details',
        style: verificationTitle,
      ),
      elevations: 4,
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

  Widget mainBody(DotsDecorator decorator) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
        ),
        child: Column(
          children: [
            16.verticalSpace,
            yourOrderStatus(decorator),
            16.verticalSpace,
            orderId(),
            16.verticalSpace,
            walmart(),
            16.verticalSpace,
            safeWay(),
            16.verticalSpace,
            totalAmountView(),
            16.verticalSpace,
            ElevatedButton(
              onPressed: () {
                // navigation to contact us screen
                AutoRouter.of(context).push(const ContactUsRoute());
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(324.w, 52.h),
                primary: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(buttonRadius),
                ),
              ),
              child: Text(
                'For any Questions, Contact Us',
                style: loginButtonText,
              ),
            ),
            16.verticalSpace,
          ],
        ),
      ),
    );
  }

  Container yourOrderStatus(DotsDecorator decorator) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 15,
        left: 15,
      ).r,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          const Radius.circular(8).r,
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColor.introNextColorWhite,
            blurRadius: 10,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your order status',
            style: orderHeading,
          ),
          10.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColor.greenColor,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0).r,
                      child: Center(
                        child: Icon(
                          Icons.check,
                          size: 12.r,
                          color: AppColor.introNextColorWhite,
                        ),
                      ),
                    ),
                  ),
                  DotsIndicator(
                    dotsCount: totalDots,
                    axis: Axis.vertical,
                    decorator: decorator,
                  ),
                ],
              ),
              16.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Placed',
                    style: orderStatus,
                  ),
                  Text(
                    '25 Feb, 2019 • 3:00 pm',
                    style: regularPoppins,
                  ),
                ],
              ),
            ],
          ),
          3.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColor.greenColor,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0).r,
                      child: Center(
                        child: Icon(
                          Icons.check,
                          size: 12.r,
                          color: AppColor.introNextColorWhite,
                        ),
                      ),
                    ),
                  ),
                  DotsIndicator(
                    dotsCount: totalDots,
                    axis: Axis.vertical,
                    decorator: decorator,
                  ),
                ],
              ),
              16.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Item Picked Up',
                    style: orderStatus,
                  ),
                  Text(
                    '25 Feb, 2019 • 3:00 pm',
                    style: regularPoppins,
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              DottedBorder(
                strokeWidth: 2.w,
                borderType: BorderType.Oval,
                color: AppColor.greenColor,
                padding: const EdgeInsets.all(6).r,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColor.greenColor,
                    shape: BoxShape.circle,
                  ),
                  height: 10.r,
                  width: 10.r,
                ),
              ),
              16.horizontalSpace,
              Text(
                'On The Way',
                style: orderStatus,
              ),
            ],
          ),
          DotsIndicator(
            dotsCount: totalDots,
            axis: Axis.vertical,
            decorator: DotsDecorator(
              shape: const Border(),
              activeColor: AppColor.dotsBorder,
              size: const Size.square(3.0),
              spacing: const EdgeInsets.only(
                top: 1,
                bottom: 1,
                left: 8,
              ).r,
              color: AppColor.dotsBorder,
              activeSize: const Size.square(0.0),
            ),
          ),
          Row(
            children: [
              DottedBorder(
                strokeWidth: 2.w,
                borderType: BorderType.Oval,
                color: AppColor.dotsBorder,
                padding: const EdgeInsets.all(6).r,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColor.introNextColorWhite,
                    shape: BoxShape.circle,
                  ),
                  height: 10.r,
                  width: 10.r,
                ),
              ),
              16.horizontalSpace,
              Text(
                'Delivered',
                style: delivered,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget orderId() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          const Radius.circular(8).r,
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColor.introNextColorWhite,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 12,
              right: 10,
            ).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order Id : ABC1299',
                  style: order,
                ),
                Text(
                  'On The Way',
                  style: onTheWay,
                ),
              ],
            ),
          ),
          12.h.verticalSpace,
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 10,
            ).r,
            child: Text(
              'Delivery Date & Time',
              style: delivery,
            ),
          ),
          12.verticalSpace,
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 10,
            ).r,
            child: Text(
              '2 February, 2019 • 3:00 pm',
              style: deliveryTime,
            ),
          ),
          12.verticalSpace,
          dottedLine(),
          12.verticalSpace,
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 10,
            ).r,
            child: Text(
              'Payment Method',
              style: payment,
            ),
          ),
          12.verticalSpace,
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 10,
            ).r,
            child: Row(
              children: [
                Image.asset(
                  Assets.commonMastercard,
                  height: 30.r,
                  width: 30.r,
                ),
                DotsIndicator(
                  dotsCount: 5,
                  axis: Axis.horizontal,
                  decorator: DotsDecorator(
                    shape: const Border(),
                    activeColor: AppColor.introTitleColorBlack,
                    size: const Size.square(3.0),
                    spacing: const EdgeInsets.only(
                      top: 1,
                      bottom: 1,
                      left: 8,
                    ).r,
                    color: AppColor.introTitleColorBlack,
                    activeSize: const Size.square(0.0),
                  ),
                ),
                DotsIndicator(
                  dotsCount: 5,
                  axis: Axis.horizontal,
                  decorator: DotsDecorator(
                    shape: const Border(),
                    activeColor: AppColor.introTitleColorBlack,
                    size: const Size.square(3.0),
                    spacing:
                        const EdgeInsets.only(top: 1, bottom: 1, left: 8).r,
                    color: AppColor.introTitleColorBlack,
                    activeSize: const Size.square(0.0),
                  ),
                ),
                8.horizontalSpace,
                Text(
                  '1234',
                  style: numCard,
                )
              ],
            ),
          ),
          12.verticalSpace,
          dottedLine(),
          28.verticalSpace,
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 10,
            ).r,
            child: Text(
              'Delivery Address',
              style: order,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 10,
            ).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '799 Lost Creek Road',
                      style: address,
                    ),
                    Text(
                      'Seattle , Fort NewYork, Us, 19034 ',
                      style: address,
                    ),
                  ],
                ),
                Image.asset(
                  Assets.commonLocation,
                  height: 40.r,
                  width: 40.r,
                ),
              ],
            ),
          ),
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

  Widget walmart() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          const Radius.circular(8).r,
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColor.introNextColorWhite,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          14.verticalSpace,
          Padding(
            padding: const EdgeInsets.only(
              left: 18.0,
            ).r,
            child: Text(
              'Walmart',
              style: productTitle,
            ),
          ),
          14.verticalSpace,
          const Divider(),
          Row(
            children: [
              Image.asset(
                Assets.milkLactaidFatFreePureMilk,
                height: 71.r,
                width: 71.r,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Lactaid Fat Free Pure Milk',
                      style: productHeading,
                    ),
                    10.h.verticalSpace,
                    Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                      style: productDec,
                    )
                  ],
                ),
              ),
            ],
          ),
          14.verticalSpace,
          dottedLine(),
          14.verticalSpace,
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 10,
            ).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Unit : 20 mg',
                  style: delivery,
                ),
                SizedBox(
                  height: 20.h,
                  child: verticalDivider(),
                ),
                Text(
                  'Qty : 1',
                  style: delivery,
                ),
                SizedBox(
                  height: 20.h,
                  child: verticalDivider(),
                ),
                Text(
                  '\$ 15.00',
                  style: delivery,
                ),
              ],
            ),
          ),
          14.verticalSpace,
          dottedLine(),
          14.verticalSpace,
          const Divider(),
          Row(
            children: [
              Image.asset(
                Assets.milkLactaidFatFreePureMilk,
                height: 71.r,
                width: 71.r,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lactaid Fat Free Pure Milk',
                      style: productHeading,
                    ),
                    10.h.verticalSpace,
                    Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                      style: productDec,
                    ),
                  ],
                ),
              )
            ],
          ),
          14.verticalSpace,
          dottedLine(),
          14.verticalSpace,
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 10,
            ).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Unit : 20 mg',
                  style: delivery,
                ),
                SizedBox(
                  height: 20.h,
                  child: verticalDivider(),
                ),
                Text(
                  'Qty : 1  ',
                  style: delivery,
                ),
                SizedBox(
                  height: 20.h,
                  child: verticalDivider(),
                ),
                Text(
                  '\$ 35.00',
                  style: delivery,
                ),
              ],
            ),
          ),
          14.verticalSpace,
          dottedLine(),
        ],
      ),
    );
  }

  VerticalDivider verticalDivider() {
    return VerticalDivider(
      thickness: 1.r,
      color: AppColor.verticalDivider,
    );
  }

  Widget safeWay() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          const Radius.circular(8).r,
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColor.introNextColorWhite,
            blurRadius: 10,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          14.verticalSpace,
          Padding(
            padding: const EdgeInsets.only(left: 18.0).r,
            child: Text(
              'Safeway',
              style: productTitle,
            ),
          ),
          14.verticalSpace,
          const Divider(),
          Row(
            children: [
              Image.asset(
                Assets.milkLactaidFatFreePureMilk,
                height: 71.r,
                width: 71.r,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lactaid Fat Free Pure Milk',
                      style: productHeading,
                    ),
                    10.h.verticalSpace,
                    Text(
                      StringConstant.introPageSubTitle,
                      style: productDec,
                    ),
                  ],
                ),
              )
            ],
          ),
          14.verticalSpace,
          dottedLine(),
          14.verticalSpace,
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 10,
              bottom: 10,
            ).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Unit : 20 mg',
                  style: delivery,
                ),
                SizedBox(
                  height: 20.h,
                  child: verticalDivider(),
                ),
                Text(
                  'Qty : 1',
                  style: delivery,
                ),
                SizedBox(
                  height: 20.h,
                  child: verticalDivider(),
                ),
                Text(
                  '\$ 10.00',
                  style: delivery,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget totalAmountView() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          const Radius.circular(8).r,
        ),
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
              left: 15,
              right: 10,
              bottom: 10,
            ).r,
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
                        const Icon(
                          Icons.info_outline,
                          color: AppColor.hintText,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '\$ 60.00',
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
                          'Tax',
                          style: subTotalText,
                        ),
                        5.horizontalSpace,
                        const Icon(
                          Icons.info_outline,
                          color: AppColor.hintText,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '\$ 5.00',
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
                          'Service Fee',
                          style: subTotalText,
                        ),
                        5.horizontalSpace,
                        const Icon(
                          Icons.info_outline,
                          color: AppColor.hintText,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '\$ 2.00',
                          style: subTotalPrice,
                        ),
                        8.horizontalSpace,
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
                        const Icon(
                          Icons.info_outline,
                          color: AppColor.hintText,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '\$ 3.00',
                          style: subTotalPrice,
                        ),
                        8.horizontalSpace,
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
            padding: const EdgeInsets.only(
              right: 10.0,
            ).r,
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
            padding: const EdgeInsets.only(
              left: 15,
              right: 10.0,
            ).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Promo Applied (OFF20%)',
                  style: subTotalText,
                ),
                Text(
                  '- \$ 13.00',
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
                margin: const EdgeInsetsDirectional.only(
                  end: 10.0,
                ),
                color: AppColor.verticalDivider,
              ),
            ),
          ),
          16.verticalSpace,
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 10.0,
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
          ),
        ],
      ),
    );
  }
}
