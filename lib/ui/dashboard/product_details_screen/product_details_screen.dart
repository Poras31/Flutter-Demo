import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/app_router/app_router.dart';
import 'package:chat_ui_demo/generated/assets.dart';
import 'package:chat_ui_demo/ui/dashboard/category_screen/category_food_milk_model.dart';
import 'package:chat_ui_demo/ui/intro_screen/custom_app_button.dart';
import 'package:chat_ui_demo/ui/utils/base_app_bar.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/dimens.dart';
import 'package:chat_ui_demo/values/string_constatnt.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ProductDetailsScreen extends StatefulWidget {
  final CategoryFoodMilkModel categoryFoodMilkModel;
  const ProductDetailsScreen({super.key, required this.categoryFoodMilkModel});

  @override
  State<StatefulWidget> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int currentIndex = 0;
  late ValueNotifier productValueNotifire;
  late PageController productViewController;

  @override
  void initState() {
    productValueNotifire = ValueNotifier(true);
    productViewController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    productViewController.dispose();
    productValueNotifire.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: buildBaseAppBar(),
      bottomNavigationBar: bottomButton(),
      body: mainBody(),
      backgroundColor: AppColor.deliveryBG,
    );
  }

  BaseAppBar buildBaseAppBar() {
    return BaseAppBar(
      title: Text(
        'Product Details',
        style: verificationTitle,
      ),
      leadingWidget: InkWell(
        onTap: () {
          //navigation to back screen.
          AutoRouter.of(context).pop();
        },
        child: const Icon(
          Icons.arrow_back_ios_sharp,
          color: AppColor.introTitleColorBlack,
        ),
      ),
      action: [
        InkWell(
          onTap: () {
            // navigation to cart screen
            AutoRouter.of(context).push(const ViewCartRoute());
          },
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              right: 8.0,
            ).r,
            child: Image.asset(
              Assets.commonCart,
              height: 25.r,
              width: 25.r,
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomButton() {
    return Container(
      color: AppColor.introNextColorWhite.withOpacity(0.7),
      padding: const EdgeInsets.only(
        left: 40.0,
        right: 40.0,
        bottom: 15.0,
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
          //navigation to add to cart screen
          AutoRouter.of(context).push(const ViewCartRoute());
        },
        label: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.categoryFoodsLock,
              height: 20.r,
              width: 20.r,
            ),
            10.w.horizontalSpace,
            Text(
              'Add to Cart',
              style: loginButtonText,
            )
          ],
        ),
      ),
    );
  }

  Widget mainBody() {
    return SingleChildScrollView(
      //physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0).r,
              child: Column(
                children: [
                  mainImagePage(),
                  bottomSliders(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.categoryFoodMilkModel.foodName,
                      style: category.copyWith(fontSize: 15.spMin),
                    ),
                  ),
                  20.h.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$ 15',
                        style: reviewText.copyWith(
                          fontSize: 20.sm,
                        ),
                      ),
                      Container(
                        width: 105.w,
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5).r,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColor.greenColor,
                          ),
                          borderRadius: BorderRadius.circular(20).r,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              Assets.commonDelete,
                              height: 14.r,
                              width: 14.r,
                            ),
                            Text(
                              '1',
                              style: milkMore,
                            ),
                            const Icon(Icons.add),
                          ],
                        ),
                      ),
                      Text(
                        widget.categoryFoodMilkModel.foodGram,
                        style: category.copyWith(
                          fontSize: 15.sm,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          15.h.verticalSpace,
          Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0).r,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Details',
                    style: order.copyWith(fontSize: 15.sm),
                  ),
                  15.h.verticalSpace,
                  Text(
                    StringConstant.aboutUs,
                    style: numCard,
                  ),
                  50.h.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget mainImagePage() {
    return SizedBox(
      height: 130.h,
      width: MediaQuery.of(context).size.width,
      child: ValueListenableBuilder(
        valueListenable: productValueNotifire,
        builder: (context, value, child) {
          return PageView.builder(
            itemCount: 5,
            onPageChanged: (int index) {
              currentIndex = index;
              productValueNotifire.value = currentIndex;
            },
            itemBuilder: (context, index) {
              return Image.asset(widget.categoryFoodMilkModel.foodImage);
            },
          );
        },
      ),
    );
  }

  ValueListenableBuilder bottomSliders() {
    return ValueListenableBuilder(
      valueListenable: productValueNotifire,
      builder: (BuildContext context, value, Widget? child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: 62.h,
              width: 130.w,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 34,
                      horizontal: 5,
                    ).r,
                    child: Container(
                      width: 15.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: currentIndex == index
                            ? AppColor.greenColor
                            : AppColor.greyColor,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
