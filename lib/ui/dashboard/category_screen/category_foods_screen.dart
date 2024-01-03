import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/app_router/app_router.dart';
import 'package:chat_ui_demo/generated/assets.dart';
import 'package:chat_ui_demo/ui/dashboard/category_screen/category_food_milk_model.dart';
import 'package:chat_ui_demo/ui/dashboard/category_screen/category_food_milk_widgets.dart';
import 'package:chat_ui_demo/ui/dashboard/category_screen/category_food_widget.dart';
import 'package:chat_ui_demo/ui/dashboard/category_screen/category_foods_model.dart';
import 'package:chat_ui_demo/ui/utils/base_app_bar.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/string_constatnt.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class CategoryFoodsScreen extends StatefulWidget {
  const CategoryFoodsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CategoryFoodsScreenState();
}

class _CategoryFoodsScreenState extends State<CategoryFoodsScreen> {
  List<CategoryFoodsModel> categoryFoodsModel = [
    CategoryFoodsModel(
      categoryName: 'Dairy & Eggs',
      categoryImage: Assets.categoryFoodsDairyEggs,
    ),
    CategoryFoodsModel(
      categoryName: 'Snacks',
      categoryImage: Assets.categoryFoodsSnacks,
    ),
    CategoryFoodsModel(
      categoryName: 'Seafood',
      categoryImage: Assets.categoryFoodsSeafood,
    ),
    CategoryFoodsModel(
      categoryName: 'Frozen Foods',
      categoryImage: Assets.categoryFoodsFrozenFoods,
    ),
    CategoryFoodsModel(
      categoryName: 'Snacks',
      categoryImage: Assets.categoryFoodsSnacks,
    ),
    CategoryFoodsModel(
      categoryName: 'Seafood',
      categoryImage: Assets.categoryFoodsSeafood,
    ),
    CategoryFoodsModel(
      categoryName: 'Dairy & Eggs',
      categoryImage: Assets.categoryFoodsDairyEggs,
    ),
    CategoryFoodsModel(
      categoryName: 'Snacks',
      categoryImage: Assets.categoryFoodsSnacks,
    ),
  ];

  late ValueNotifier<int> isSelectedModifire = ValueNotifier(0);

  int selectedIndex = 0;

  List<CategoryFoodMilkModel> categoryFoodMilkModel = [
    CategoryFoodMilkModel(
      foodName: 'Lactaid Fat Free Pure Milk',
      foodImage: Assets.milkLactaidFatFreePureMilk,
      foodPrice: '\$ 15',
      foodGram: '20 mg',
    ),
    CategoryFoodMilkModel(
      foodName: 'Lactaid Whole Pure Milk',
      foodImage: Assets.milkLactaidWholePureMilk,
      foodPrice: '\$ 35',
      foodGram: '22 mg',
    ),
    CategoryFoodMilkModel(
      foodName: 'Lactaid Fat Free Pure Milk',
      foodImage: Assets.milkLactaidFatFreePureMilk,
      foodPrice: '\$ 15',
      foodGram: '20 mg',
    ),
    CategoryFoodMilkModel(
      foodName: 'Lactaid Whole Pure Milk',
      foodImage: Assets.milkLactaidWholePureMilk,
      foodPrice: '\$ 35',
      foodGram: '22 mg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColor.dotsBorder,
      appBar: makeBaseAppBar(),
      body: mainBody(),
    );
  }

  BaseAppBar makeBaseAppBar() {
    return BaseAppBar(
      backgroundColor: AppColor.transparent,
      title: const Text(
        'Walmart',
      ),
      centerTitle: true,
      leadingWidget: InkWell(
        onTap: () {
          //navigation back to previous screen
          AutoRouter.of(context).pop();
        },
        child: const Icon(
          Icons.arrow_back_ios_sharp,
          color: AppColor.introNextColorWhite,
        ),
      ),
      action: [
        Padding(
          padding: const EdgeInsets.only(right: 22.0).r,
        ),
        InkWell(
          onTap: () {
            //navigation to view cart screen
            AutoRouter.of(context).push(const ViewCartRoute());
          },
          child: const Icon(
            Icons.shopping_cart,
            color: AppColor.introNextColorWhite,
          ),
        ),
      ],
    );
  }

  Widget mainBody() {
    return Column(
      children: [
        SizedBox(
          height: 300.h,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                height: 290.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.walmart,
                  image: DecorationImage(
                    image: const AssetImage(
                      Assets.commonWalmartInside,
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3),
                      BlendMode.darken,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 130,
                right: 0,
                left: 0,
                child: ListTile(
                  title: Column(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          Assets.commonWalmart,
                          width: 74.r,
                          height: 74.r,
                          fit: BoxFit.fill,
                        ),
                      ),
                      10.h.verticalSpace,
                      Text(
                        '3456 Washington Street, Us, 4568',
                        style: introNextGoButtonText,
                      ),
                      10.h.verticalSpace,
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.only(right: 13, left: 20).r,
                            child: const Icon(
                              Icons.search,
                              size: 30,
                              color: AppColor.hintText,
                            ),
                          ),
                          hintStyle: hintText,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(42).r,
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          fillColor: AppColor.textBoxFillColor,
                          filled: true,
                          hintText: "Search Walmart...",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        bottom: 8.0,
                      ).r,
                      child: Container(
                        color: AppColor.deliveryBG,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0).r,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  StringConstant.chooseYourCategory,
                                  style: introTitleText,
                                ),
                              ),
                            ),
                            ValueListenableBuilder(
                              valueListenable: isSelectedModifire,
                              builder: (context, value, child) {
                                return SizedBox(
                                  height: 120.h,
                                  child: ListView.builder(
                                    padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20.0,
                                    ).r,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: categoryFoodsModel.length,
                                    itemBuilder: (context, index) {
                                      final CategoryFoodsModel model =
                                          categoryFoodsModel[index];
                                      return InkWell(
                                        onTap: () {
                                          onSelected(index);
                                        },
                                        child: CategoryFoodsWidget(
                                          categoryFoodsModel: model,
                                          index: index,
                                          selectedIndex: selectedIndex,
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: AppColor.deliveryBG,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0).r,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Milk',
                                  style: milkMore,
                                ),
                                InkWell(
                                  onTap: () {
                                    //navigation to more milk screen
                                    AutoRouter.of(context).push(
                                      MoreProductRoute(
                                          categoryFoodMilkModel:
                                              categoryFoodMilkModel),
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        'More',
                                        style: introSkipText,
                                      ),
                                      const Icon(
                                        Icons.keyboard_arrow_right,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 200.h,
                            child: ListView.builder(
                              shrinkWrap: true,
                              padding: const EdgeInsets.only(
                                left: 20.0,
                                right: 20.0,
                              ).r,
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount: categoryFoodMilkModel.length,
                              itemBuilder: (context, index) {
                                final CategoryFoodMilkModel foodMilkModel =
                                    categoryFoodMilkModel[index];
                                return CategoryFoodMillWidget(
                                  categoryFoodMilkModel: foodMilkModel,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    7.h.verticalSpace,
                    Container(
                      color: AppColor.deliveryBG,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0).r,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Ice cream',
                                  style: milkMore,
                                ),
                                InkWell(
                                  onTap: () {
                                    //navigation to more product screen.
                                    AutoRouter.of(context).push(
                                      MoreProductRoute(
                                          categoryFoodMilkModel:
                                              categoryFoodMilkModel),
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        'More',
                                        style: introSkipText,
                                      ),
                                      const Icon(
                                        Icons.keyboard_arrow_right,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 200.h,
                            child: ListView.builder(
                              shrinkWrap: true,
                              padding: const EdgeInsets.only(
                                left: 20.0,
                                right: 20.0,
                              ).r,
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount: categoryFoodMilkModel.length,
                              itemBuilder: (context, index) {
                                final CategoryFoodMilkModel finalMilkModel =
                                    categoryFoodMilkModel[index];
                                return CategoryFoodMillWidget(
                                  categoryFoodMilkModel: finalMilkModel,
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    7.h.verticalSpace,
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void onSelected(int index) {
    selectedIndex = index;
    isSelectedModifire.value = selectedIndex;
  }
}
