import 'package:chat_ui_demo/ui/dashboard/details/store_details_model.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreDetailsWidget extends StatelessWidget {
  final StoreDetailsModel storeDetailsModel;
  const StoreDetailsWidget({
    Key? key,
    required this.storeDetailsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 10.0,
        bottom: 10.0,
      ).r,
      child: Column(
        children: [
          Row(
            children: [
              ClipOval(
                child: Image.asset(
                  height: 70.r,
                  width: 70.r,
                  fit: BoxFit.cover,
                  storeDetailsModel.image,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0).r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            storeDetailsModel.name,
                            style: phoneText,
                          ),
                          Text(
                            storeDetailsModel.time,
                            style: timeText,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          5.verticalSpace,
                          RatingBar(
                            initialRating: 3,
                            itemSize: 12.r,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            ratingWidget: RatingWidget(
                              full: const Icon(
                                Icons.star,
                                color: AppColor.orange,
                              ),
                              half: const Icon(Icons.star_half,
                                  color: AppColor.orange),
                              empty: const Icon(Icons.star_outline,
                                  color: AppColor.orange),
                            ),
                            onRatingUpdate: (double value) {},
                          ),
                          5.h.verticalSpace,
                          Text(
                            storeDetailsModel.dec,
                            style: storeCategory,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          10.h.verticalSpace,
          const Divider(
            color: AppColor.verticalDivider,
          )
        ],
      ),
    );
  }
}
