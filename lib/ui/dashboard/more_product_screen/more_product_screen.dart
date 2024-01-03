import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/app_router/app_router.dart';
import 'package:chat_ui_demo/generated/assets.dart';
import 'package:chat_ui_demo/ui/dashboard/category_screen/category_food_milk_model.dart';
import 'package:chat_ui_demo/ui/dashboard/category_screen/category_food_milk_widgets.dart';
import 'package:chat_ui_demo/ui/utils/base_app_bar.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class MoreProductScreen extends StatefulWidget {
  final List<CategoryFoodMilkModel> categoryFoodMilkModel;

  const MoreProductScreen({super.key, required this.categoryFoodMilkModel});

  @override
  State<StatefulWidget> createState() => _MoreProductScreenState();
}

class _MoreProductScreenState extends State<MoreProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgOrderDetails,
      appBar: makeBseAppBar(),
      body: mainBody(),
    );
  }

  BaseAppBar makeBseAppBar() {
    return BaseAppBar(
      title: Text(
        'Milk',
        style: verificationTitle,
      ),
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
      elevations: 4,
      centerTitle: true,
      shadowColor: AppColor.baseAppBar,
      action: [
        InkWell(
            onTap: () {
              //navigation to cart screen
              AutoRouter.of(context).push(const ViewCartRoute());
            },
            child: Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                right: 8.0,
              ).r,
              child: Image.asset(
                Assets.commonCart,
                width: 25.r,
                height: 25.r,
              ),
            ))
      ],
    );
  }

  Widget mainBody() {
    return GridView.builder(
      padding: const EdgeInsets.only(
        top: 20.0,
        left: 20.0,
        right: 20.0,
      ).r,
      itemCount: 4,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        final CategoryFoodMilkModel milkModel =
            widget.categoryFoodMilkModel[index];
        return CategoryFoodMillWidget(categoryFoodMilkModel: milkModel);
      },
    );
  }
}
