import 'package:chat_ui_demo/ui/dashboard/category_screen/category_foods_model.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryFoodsWidget extends StatelessWidget {
  final CategoryFoodsModel categoryFoodsModel;
  final int index;
  final int selectedIndex;

  const CategoryFoodsWidget({
    Key? key,
    required this.categoryFoodsModel,
    required this.selectedIndex,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0).r,
          child: Container(
            height: 70.r,
            width: 70.r,
            decoration: BoxDecoration(
              border: Border.all(
                color: selectedIndex == index
                    ? AppColor.greenColor
                    : AppColor.introNextColorWhite,
              ),
              shape: BoxShape.circle,
              color: AppColor.introNextColorWhite,
              boxShadow: [
                selectedIndex == index
                    ? BoxShadow(
                        offset: Offset(0.r, 2.r),
                        color: AppColor.greenColor,
                        blurRadius: 10.r)
                    : BoxShadow(
                        color: AppColor.introNextColorWhite,
                        offset: Offset(0.r, 2.r),
                        blurRadius: 10.r,
                      ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0).r,
              child: Image.asset(
                height: 30.r,
                width: 30.r,
                fit: BoxFit.fill,
                categoryFoodsModel.categoryImage,
              ),
            ),
          ),
        ),
        10.verticalSpace,
        Text(
          categoryFoodsModel.categoryName,
          style: TextStyle(
              fontSize: 14.sm,
              color: selectedIndex == index
                  ? AppColor.greenColor
                  : AppColor.introTitleColorBlack),
        ),
      ],
    );
  }
}
