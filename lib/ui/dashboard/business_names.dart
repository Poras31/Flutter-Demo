import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/app_router/app_router.dart';
import 'package:chat_ui_demo/generated/assets.dart';
import 'package:chat_ui_demo/ui/dashboard/store_name_item_widget.dart';
import 'package:chat_ui_demo/ui/dashboard/store_names_model.dart';
import 'package:chat_ui_demo/ui/utils/base_app_bar.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class StoreNamesScreen extends StatefulWidget {
  const StoreNamesScreen({super.key});

  @override
  State<StatefulWidget> createState() => _StoreNamesScreenState();
}

class _StoreNamesScreenState extends State<StoreNamesScreen> {
  List<StoreNamesModel> storeModel = [
    StoreNamesModel(
      storeName: "Walmart",
      storeImage: Assets.commonWalmart,
      storeMile: "1 mile",
      storeCategory: "Grocery",
      storeAddress: "3456 Washington Street, Us, 456",
    ),
    StoreNamesModel(
      storeName: "Stop & Shop",
      storeImage: Assets.commonWalmart,
      storeMile: "2 mile",
      storeCategory: "Grocery and general",
      storeAddress: "3456 Washington Street, Us, 456",
    ),
    StoreNamesModel(
      storeName: "Safeway",
      storeImage: Assets.commonWalmart,
      storeMile: "3.5 mile",
      storeCategory: "Grocery",
      storeAddress: "3456 Washington Street, Us, 456",
    ),
    StoreNamesModel(
      storeName: "Giant Food Stores",
      storeImage: Assets.commonWalmart,
      storeMile: "4 mile",
      storeCategory: "Grocery",
      storeAddress: "3456 Washington Street, Us, 456",
    ),
    StoreNamesModel(
      storeName: "Meijer",
      storeImage: Assets.commonWalmart,
      storeMile: "4 mile",
      storeCategory: "Grocery",
      storeAddress: "3456 Washington Street, Us, 456",
    ),
    StoreNamesModel(
      storeName: "Walmart",
      storeImage: Assets.commonWalmart,
      storeMile: "1 mile",
      storeCategory: "Grocery",
      storeAddress: "3456 Washington Street, Us, 456",
    ),
    StoreNamesModel(
      storeName: "Stop & Shop",
      storeImage: Assets.commonWalmart,
      storeMile: "2 mile",
      storeCategory: "Grocery and general",
      storeAddress: "3456 Washington Street, Us, 456",
    ),
    StoreNamesModel(
      storeName: "Safeway",
      storeImage: Assets.commonWalmart,
      storeMile: "3.5 mile",
      storeCategory: "Grocery",
      storeAddress: "3456 Washington Street, Us, 456",
    ),
    StoreNamesModel(
      storeName: "Giant Food Stores",
      storeImage: Assets.commonWalmart,
      storeMile: "4 mile",
      storeCategory: "Grocery",
      storeAddress: "3456 Washington Street, Us, 456",
    ),
    StoreNamesModel(
      storeName: "Giant Food Stores",
      storeImage: Assets.commonWalmart,
      storeMile: "4 mile",
      storeCategory: "Grocery",
      storeAddress: "3456 Washington Street, Us, 456",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar(),
      body: mainBody(),
    );
  }

  BaseAppBar baseAppBar() {
    return BaseAppBar(
      action: [
        InkWell(
          onTap: () {
            //navigation to add to cart screen
            AutoRouter.of(context).push(const ViewCartRoute());
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 16.0).r,
            child: Image.asset(
              Assets.commonCart,
              width: 25.r,
              height: 25.r,
            ),
          ),
        ),
      ],
      title: Text(
        "Huge Basket",
        style: verificationTitle,
      ),
      elevations: 4,
      shadowColor: AppColor.baseAppBar,
      leadingWidget: Padding(
        padding: const EdgeInsets.only(left: 16, top: 8).r,
        child: InkWell(
          onTap: () {
            // navigation to other screen
            AutoRouter.of(context).push(const NotificationRoute());
          },
          child: Image.asset(Assets.commonNotification),
        ),
      ),
      leadingWidth: 35.w,
    );
  }

  Widget mainBody() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15).r,
          alignment: Alignment.center,
          color: AppColor.deliveryBG,
          child: Text(
            'Next delivery on Wed, 14 Nov 2020',
            style: deliveryHuge,
          ),
        ),
        15.verticalSpace,
        Flexible(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: storeModel.length,
            itemBuilder: (BuildContext context, int index) {
              final StoreNamesModel model = storeModel[index];
              return StoreNamesItemWidgets(
                productModel: model,
              );
            },
          ),
        )
      ],
    );
  }
}
