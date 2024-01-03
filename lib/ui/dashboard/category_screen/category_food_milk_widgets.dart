import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/app_router/app_router.dart';
import 'package:chat_ui_demo/generated/assets.dart';
import 'package:chat_ui_demo/ui/dashboard/category_screen/category_food_milk_model.dart';
import 'package:chat_ui_demo/ui/utils/dotted_border.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryFoodMillWidget extends StatefulWidget {
  final CategoryFoodMilkModel categoryFoodMilkModel;

  const CategoryFoodMillWidget({
    Key? key,
    required this.categoryFoodMilkModel,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CategoryFoodMillWidgetState();
}

class _CategoryFoodMillWidgetState extends State<CategoryFoodMillWidget> {
  final ValueNotifier visibleCount = ValueNotifier(false);

  // this is other way to create a widget
  /*@override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //navigation to product details screen
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 8).r,
        width: 180.w,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: AppColor.introNextColorWhite,
          ),
          child: Stack(
            children: [
              ValueListenableBuilder(
                valueListenable: visibleCount,
                builder: (BuildContext context, value, Widget? child) {
                  return InkWell(
                    onTap: () {
                      visibleCount.value = !visibleCount.value;
                    },
                    child: visibleCount.value
                        ? Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              right: 20,
                            ).r,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: 100.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30).r,
                                  border: Border.all(
                                    color: AppColor.greenColor,
                                  ),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Column(
                                  children: [
                                    10.h.verticalSpace,
                                    const Icon(
                                      Icons.add,
                                    ),
                                    10.h.verticalSpace,
                                    const Text(
                                      '1',
                                    ),
                                    10.h.verticalSpace,
                                    Image.asset(
                                      Assets.commonDelete,
                                      height: 13.r,
                                      width: 13.r,
                                    ),
                                    10.h.verticalSpace,
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              right: 20,
                            ).r,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: SizedBox(
                                height: 26.r,
                                width: 26.r,
                                child: CustomDottedBorder(
                                  strokeWidth: 2.w,
                                  borderType: BorderType.Oval,
                                  color: AppColor.greenColor,
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          AppColor.greenColor.withOpacity(0.2),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      size: 20.r,
                                      color: AppColor.greenColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                  );
                },
              ),
              Positioned(
                left: 20,
                top: 20,
                child: Image.asset(
                  widget.categoryFoodMilkModel.foodImage,
                  height: 88.h,
                ),
              ),
              Column(
                children: [
                  100.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ).r,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.categoryFoodMilkModel.foodPrice,
                        ),
                        Text(
                          widget.categoryFoodMilkModel.foodGram,
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0).r,
                      child: Text(
                        widget.categoryFoodMilkModel.foodName,
                        style: category.copyWith(
                          fontSize: 15.sm,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }*/

  //ANd this is another way to create a widget
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AutoRouter.of(context).push(
          ProductDetailsRoute(
              categoryFoodMilkModel: widget.categoryFoodMilkModel),
        );
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 8).r,
        width: 180.w,
        /*decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 30,
              offset: Offset(0, 2),
              color: Colors.grey,
            ),
          ],
        ),*/
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.introNextColorWhite,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 120.h,
                child: Stack(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: visibleCount,
                      builder: (BuildContext context, value, Widget? child) {
                        return InkWell(
                          onTap: () {
                            visibleCount.value = !visibleCount.value;
                          },
                          child: visibleCount.value
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                    top: 20,
                                    right: 20,
                                  ).r,
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      height: 100.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30).r,
                                        border: Border.all(
                                          color: AppColor.greenColor,
                                        ),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Column(
                                        children: [
                                          10.h.verticalSpace,
                                          const Icon(
                                            Icons.add,
                                          ),
                                          10.h.verticalSpace,
                                          Text(
                                            '1',
                                            style: milkMore,
                                          ),
                                          10.h.verticalSpace,
                                          Image.asset(
                                            Assets.commonDelete,
                                            height: 13.r,
                                            width: 13.r,
                                          ),
                                          10.h.verticalSpace,
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(
                                    top: 20,
                                    right: 20,
                                  ).r,
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: SizedBox(
                                      height: 26.r,
                                      width: 26.r,
                                      child: CustomDottedBorder(
                                        strokeWidth: 2.w,
                                        borderType: BorderType.Oval,
                                        color: AppColor.greenColor,
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColor.greenColor
                                                .withOpacity(0.2),
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            size: 20.r,
                                            color: AppColor.greenColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        );
                      },
                    ),
                    Positioned(
                      left: 20,
                      top: 20,
                      child: Image.asset(
                        widget.categoryFoodMilkModel.foodImage,
                        height: 88.h,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.categoryFoodMilkModel.foodPrice,
                      style: reviewText.copyWith(
                        fontSize: 12.sm,
                      ),
                    ),
                    Text(
                      widget.categoryFoodMilkModel.foodGram,
                      style: category,
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(10.0).r,
                  child: Text(
                    widget.categoryFoodMilkModel.foodName,
                    style: category.copyWith(
                      fontSize: 15.sm,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
