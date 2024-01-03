import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/app_router/app_router.dart';
import 'package:chat_ui_demo/ui/dashboard/store_names_model.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreNamesItemWidgets extends StatelessWidget {
  final StoreNamesModel productModel;

  const StoreNamesItemWidgets({
    required this.productModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        bottom: 10.0,
        top: 5.0,
      ).r,
      child: InkWell(
        onTap: () {
          //navigation to other screen
          AutoRouter.of(context).push(
            StoreDetailsRoute(storeNamesModel: productModel),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(10.0).r,
          decoration: BoxDecoration(
            color: AppColor.introNextColorWhite,
            borderRadius: BorderRadius.circular(16.0).r,
            boxShadow: const [
              BoxShadow(
                blurRadius: 2.0,
                color: Colors.grey,
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          productModel.storeImage,
                          width: 70.r,
                          height: 70.r,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 15.w,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(6, 3, 6, 3).r,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20).r,
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
                                    color: AppColor.introNextColorWhite,
                                  ),
                                  half: const Icon(
                                    Icons.star_half,
                                    color: AppColor.introNextColorWhite,
                                  ),
                                  empty: const Icon(
                                    Icons.star_outline,
                                    color: AppColor.introNextColorWhite,
                                  ),
                                ),
                                onRatingUpdate: (double value) {},
                              ),
                              2.horizontalSpace,
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
                      padding: const EdgeInsets.only(left: 15.5).r,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                productModel.storeName,
                                style: walmartText.copyWith(
                                  fontSize: 18.spMin,
                                ),
                              ),
                              Text(
                                productModel.storeMile,
                                style: mileText,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              10.h.verticalSpace,
                              Text(
                                productModel.storeCategory,
                                style: storeCategory,
                              ),
                              10.h.verticalSpace,
                              Text(
                                productModel.storeAddress,
                                style: storeCategory,
                              ),
                            ],
                          )
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
    );
  }
}
