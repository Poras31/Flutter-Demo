import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/app_router/app_router.dart';
import 'package:chat_ui_demo/generated/assets.dart';
import 'package:chat_ui_demo/ui/dashboard/details/store_details_model.dart';
import 'package:chat_ui_demo/ui/dashboard/details/tabview_item_widget.dart';
import 'package:chat_ui_demo/ui/dashboard/details/tabview_widget.dart';
import 'package:chat_ui_demo/ui/dashboard/store_names_model.dart';
import 'package:chat_ui_demo/ui/utils/base_app_bar.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class StoreDetailsScreen extends StatefulWidget {
  final StoreNamesModel storeNamesModel;

  const StoreDetailsScreen({super.key, required this.storeNamesModel});

  @override
  State<StatefulWidget> createState() => _StoreDetailsScreenState();
}

class _StoreDetailsScreenState extends State<StoreDetailsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  List<StoreDetailsModel> storeDetailsModel = [
    StoreDetailsModel(
      name: 'Michail trot',
      image: Assets.reviewsMichailTrot,
      dec:
          'Lorem Ipsum is simply dummy textLorem Ipsum is sim ply dummy textLorem Ipsum is simply dummy text',
      time: '2 min ago',
    ),
    StoreDetailsModel(
      name: 'Rojar marei',
      image: Assets.reviewsRajorMarei,
      dec:
          'Lorem Ipsum is simply dummy textLorem Ipsum is sim ply dummy textLorem Ipsum is simply dummy text',
      time: '2 min ago',
    ),
    StoreDetailsModel(
      name: 'Jack raben',
      image: Assets.reviewsJackRaben,
      dec:
          'Lorem Ipsum is simply dummy textLorem Ipsum is sim ply dummy textLorem Ipsum is simply dummy text',
      time: '2 min ago',
    ),
    StoreDetailsModel(
      name: 'Michail trot',
      image: Assets.reviewsMichailTrot,
      dec:
          'Lorem Ipsum is simply dummy textLorem Ipsum is sim ply dummy textLorem Ipsum is simply dummy text',
      time: '2 min ago',
    ),
    StoreDetailsModel(
      name: 'Michail trot',
      image: Assets.reviewsRajorMarei,
      dec:
          'Lorem Ipsum is simply dummy textLorem Ipsum is sim ply dummy textLorem Ipsum is simply dummy text',
      time: '2 min ago',
    ),
    StoreDetailsModel(
      name: 'Michail trot',
      image: Assets.reviewsMichailTrot,
      dec:
          'Lorem Ipsum is simply dummy textLorem Ipsum is sim ply dummy textLorem Ipsum is simply dummy text',
      time: '2 min ago',
    ),
    StoreDetailsModel(
      name: 'Michail trot',
      image: Assets.reviewsJackRaben,
      dec:
          'Lorem Ipsum is simply dummy textLorem Ipsum is sim ply dummy textLorem Ipsum is simply dummy text',
      time: '2 min ago',
    ),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: baseAppBar(context),
      backgroundColor: AppColor.introNextColorWhite,
      body: mainBody(context),
    );
  }

  Widget mainBody(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 340.h,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 270.h,
                decoration: BoxDecoration(
                  color: AppColor.walmart,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4),
                      BlendMode.darken,
                    ),
                    image: const AssetImage(
                      Assets.commonWalmartInside,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 230.h,
                right: 20.w,
                left: 20.w,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.introNextColorWhite,
                    borderRadius: BorderRadius.circular(10).r,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 1),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0).r,
                        child: InkWell(
                          onTap: () {
                            // navigator to category screen
                            AutoRouter.of(context)
                                .push(const CategoryFoodsRoute());
                            //this is for show snack bar
                            /* ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('Navigation'),
                                duration: const Duration(seconds: 2),
                                action: SnackBarAction(
                                  label: "close",
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                  },
                                ),
                              ),
                            );*/
                          },
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Stack(
                                    children: [
                                      ClipOval(
                                        child: Image.asset(
                                          height: 65.r,
                                          width: 65.r,
                                          fit: BoxFit.cover,
                                          widget.storeNamesModel.storeImage,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        left: 15.w,
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                            6,
                                            3,
                                            6,
                                            3,
                                          ).r,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20).r,
                                            color: AppColor.greenColor,
                                          ),
                                          child: Row(
                                            children: [
                                              RatingBar(
                                                initialRating: 1,
                                                itemSize: 12.h,
                                                direction: Axis.horizontal,
                                                itemCount: 1,
                                                allowHalfRating: true,
                                                ratingWidget: RatingWidget(
                                                  full: const Icon(
                                                    Icons.star,
                                                    color: AppColor
                                                        .introNextColorWhite,
                                                  ),
                                                  half: const Icon(
                                                    Icons.star_half,
                                                    color: AppColor
                                                        .introNextColorWhite,
                                                  ),
                                                  empty: const Icon(
                                                    Icons.star_outline,
                                                    color: AppColor
                                                        .introNextColorWhite,
                                                  ),
                                                ),
                                                onRatingUpdate:
                                                    (double value) {},
                                              ),
                                              3.horizontalSpace,
                                              Text(
                                                "4.5",
                                                style: rating,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 16.0,
                                        top: 5.0,
                                      ).r,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  widget.storeNamesModel
                                                      .storeName,
                                                  style: walmartText.copyWith(
                                                    fontSize: 20.sm,
                                                    overflow:
                                                        TextOverflow.visible,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                widget
                                                    .storeNamesModel.storeMile,
                                                style: mileText,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              5.h.verticalSpace,
                                              Text(
                                                widget.storeNamesModel
                                                    .storeCategory,
                                                style: groceryText.copyWith(
                                                    fontSize: 13.sm),
                                              ),
                                              5.h.verticalSpace,
                                              Text(
                                                widget.storeNamesModel
                                                    .storeAddress,
                                                style: groceryText.copyWith(
                                                    fontSize: 12.sm),
                                              ),
                                            ],
                                          ),
                                        ],
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
            ],
          ),
        ),
        TabView(
          tabController: _tabController,
        ),
        TabViewItemWidget(
          tabController: _tabController,
          storeDetailsModel: storeDetailsModel,
        ),
      ],
    );
  }
}

BaseAppBar baseAppBar(BuildContext context) {
  return BaseAppBar(
    backgroundColor: AppColor.transparent,
    title: const Text('Store Details'),
    centerTitle: true,
    leadingWidget: InkWell(
      onTap: () {
        //navigation to previous screen;
        AutoRouter.of(context).pop();
      },
      child: const Icon(
        Icons.arrow_back_ios_sharp,
        color: AppColor.introNextColorWhite,
      ),
    ),
    action: [
      Padding(
        padding: const EdgeInsets.only(right: 20.0).r,
        child: InkWell(
          onTap: () {
            //navigate to view cart screen.
            AutoRouter.of(context).push(const ViewCartRoute());
          },
          child: const Icon(
            Icons.shopping_cart,
            color: AppColor.introNextColorWhite,
          ),
        ),
      ),
    ],
  );
}
