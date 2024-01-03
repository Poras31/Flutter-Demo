import 'package:chat_ui_demo/ui/dashboard/details/store_details_model.dart';
import 'package:chat_ui_demo/ui/dashboard/details/store_details_widget.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/string_constatnt.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabViewItemWidget extends StatelessWidget {
  const TabViewItemWidget({
    Key? key,
    required TabController tabController,
    required this.storeDetailsModel,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;
  final List<StoreDetailsModel> storeDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        color: AppColor.introNextColorWhite,
        child: TabBarView(
          controller: _tabController,
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(20.0).r,
              child: Text(
                textAlign: TextAlign.start,
                StringConstant.aboutUs,
                style: aboutText,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'All Reviews (100)',
                        style: reviewText,
                      ),
                      Text(
                        'View All',
                        style: reviewText,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(10).r,
                    scrollDirection: Axis.vertical,
                    itemCount: storeDetailsModel.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final StoreDetailsModel item2 = storeDetailsModel[index];
                      return StoreDetailsWidget(
                        storeDetailsModel: item2,
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
