import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final TextStyle introTitleText = TextStyle(
  color: AppColor.introTitleColorBlack,
  fontWeight: FontWeight.bold,
  fontSize: fontSizeEighteen.spMin,
);
final TextStyle introSubTitleText = TextStyle(
  color: AppColor.hintText,
  fontSize: fontSizeFourteen.spMin,
);
final TextStyle phoneText = TextStyle(
  color: AppColor.introTitleColorBlack,
  fontWeight: FontWeight.bold,
  fontSize: fontSizeFourteen.spMin,
);
final TextStyle introSkipText = TextStyle(
  color: AppColor.introTitleColorBlack,
  fontWeight: FontWeight.bold,
  fontSize: fontSizeTwelve.spMin,
);
final TextStyle introNextGoButtonText = TextStyle(
  color: AppColor.introNextColorWhite,
  fontWeight: FontWeight.bold,
  fontSize: fontSizeTwelve.spMin,
);
final TextStyle loginButtonText = TextStyle(
  color: AppColor.introNextColorWhite,
  fontWeight: FontWeight.bold,
  fontSize: fontSizeSixteen.spMin,
);
final TextStyle verificationTitle = TextStyle(
  color: AppColor.greenColor,
  fontWeight: FontWeight.bold,
  fontSize: fontSizeEighteen.spMin,
);
final TextStyle verificationDetails = TextStyle(
  color: AppColor.introTitleColorBlack,
  fontWeight: FontWeight.bold,
  fontSize: fontSizeFourteen.spMin,
);
final TextStyle verificationHintText = TextStyle(
  color: AppColor.hintText,
  fontSize: fontSizeFourteen.spMin,
);
final TextStyle hintText = TextStyle(
  color: AppColor.hintText,
  fontSize: fontSizeFourteen.spMin,
);
final TextStyle checkBox = TextStyle(
  color: AppColor.checkBoxColor,
  fontSize: fontSizeFifteen.spMin,
);
final TextStyle termText = TextStyle(
  decoration: TextDecoration.underline,
  color: AppColor.greenColor,
  fontSize: fontSizeFifteen.spMin,
);
final TextStyle orderStatus = TextStyle(
  color: AppColor.introTitleColorBlack,
  fontSize: fontSizeThirteen.spMin,
);
final TextStyle regularPoppins = TextStyle(
  color: AppColor.checkBoxColor,
  fontSize: fontSizeTen.spMin,
);
final TextStyle orderHeading = TextStyle(
  color: AppColor.checkBoxColor,
  fontSize: fontSizeTwelve.spMin,
);
final TextStyle delivered = TextStyle(
  color: AppColor.checkBoxColor,
  fontSize: fontSizeThirteen.spMin,
);
final TextStyle order = TextStyle(
  color: AppColor.orderId,
  fontSize: fontSizeSixteen.spMin,
);
final TextStyle onTheWay = TextStyle(
  color: AppColor.onTheWay,
  fontSize: fontSizeFourteen.spMin,
);
final TextStyle delivery = TextStyle(
  color: AppColor.checkBoxColor,
  fontSize: fontSizeFourteen.spMin,
);
final TextStyle deliveryTime = TextStyle(
  color: AppColor.orderId,
  fontSize: fontSizeFourteen.spMin,
);
final TextStyle payment = TextStyle(
  color: AppColor.introTitleColorBlack,
  fontSize: fontSizeFourteen.spMin,
);
final TextStyle numCard = TextStyle(
  color: AppColor.introTitleColorBlack,
  fontSize: fontSizeFourteen.spMin,
);
final TextStyle address = TextStyle(
  color: AppColor.orderId,
  fontSize: fontSizeFourteen.spMin,
);
final TextStyle productTitle = TextStyle(
  color: AppColor.productTitle,
  fontSize: fontSizeFourteen.spMin,
);
final TextStyle productHeading = TextStyle(
  color: AppColor.orderId,
  fontSize: fontSizeFifteen.spMin,
);
final TextStyle orderPlaced = TextStyle(
  color: AppColor.orderPlaced,
  fontSize: fontSizeFourteen.spMin,
);
final TextStyle productDec = TextStyle(
  color: AppColor.introTitleColorBlack,
  fontSize: fontSizeFourteen.spMin,
);
final TextStyle subTotalText = TextStyle(
  color: AppColor.orderId,
  fontSize: fontSizeSixteen.spMin,
);
final TextStyle subTotalPrice = TextStyle(
  color: AppColor.hintText,
  fontSize: fontSizeSixteen.spMin,
  decoration: TextDecoration.lineThrough,
);
final TextStyle totalPriceText = TextStyle(
  color: AppColor.orderId,
  fontSize: fontSizeSixteen.spMin,
  fontWeight: FontWeight.bold,
);
final TextStyle discountPriceText = TextStyle(
  color: AppColor.discountPrice,
  fontSize: fontSizeSixteen.spMin,
);
final TextStyle walmartText = TextStyle(
  color: AppColor.introTitleColorBlack,
  fontSize: fontSizeTwenty.spMin,
  fontWeight: FontWeight.bold,
);
final TextStyle mileText = TextStyle(
  color: AppColor.hintText,
  fontSize: fontSizeTwelve.spMin,
);
final TextStyle groceryText = TextStyle(
  color: AppColor.introTitleColorBlack,
  fontSize: 11.spMin,
);
final TextStyle aboutText = TextStyle(
  color: AppColor.introTitleColorBlack,
  fontSize: fontSizeFourteen.spMin,
);
final TextStyle timeText = TextStyle(
  color: AppColor.timeColor,
  fontSize: fontSizeTen.spMin,
);
final TextStyle reviewText = TextStyle(
  color: AppColor.introTitleColorBlack,
  fontWeight: FontWeight.bold,
  fontSize: fontSizeFourteen.spMin,
);
final TextStyle milkMore = TextStyle(
  color: AppColor.introTitleColorBlack,
  fontSize: fontSizeSixteen.spMin,
);
final TextStyle errorStyleText = TextStyle(
  decoration: TextDecoration.none,
  fontWeight: FontWeight.w500,
  fontSize: fontSizeSixteen.spMin,
  color: AppColor.discountPrice,
  overflow: TextOverflow.ellipsis,
);
final TextStyle resendText = TextStyle(
  color: AppColor.introTitleColorBlack,
  decoration: TextDecoration.underline,
  fontWeight: FontWeight.bold,
  fontSize: fontSizeFourteen.spMin,
);
final TextStyle deliveryHuge = TextStyle(
  color: AppColor.greenColor,
  fontSize: fontSizeFifteen.spMin,
);

///Card Walmart
final TextStyle storeName = TextStyle(
  color: AppColor.storeName,
  fontWeight: FontWeight.bold,
  fontSize: fontSizeFifteen.spMin,
);
final TextStyle storeMile = TextStyle(
  color: AppColor.hintText,
  fontSize: fontSizeTwelve.spMin,
);
final TextStyle storeCategory = TextStyle(
  color: AppColor.storeCategory,
  fontSize: fontSizeTen.spMin,
);
final TextStyle rating = TextStyle(
  color: AppColor.introNextColorWhite,
  fontSize: fontSizeTen.spMin,
);
final TextStyle tabView = TextStyle(
  fontSize: fontSizeFourteen.spMin,
);
final TextStyle sub = TextStyle(
  color: AppColor.introTitleColorBlack,
  fontWeight: FontWeight.bold,
  fontSize: fontSizeSixteen.spMin,
);
final TextStyle orderTime = TextStyle(
  color: AppColor.checkBoxColor,
  fontSize: fontSizeTwelve.spMin,
);
final TextStyle totalAmount = TextStyle(
  color: AppColor.productTitle,
  fontSize: fontSizeEighteen.spMin,
  fontWeight: FontWeight.bold,
);
final TextStyle manageAddress = TextStyle(
  color: AppColor.orderId,
  height: 2,
  fontSize: fontSizeFourteen.spMin,
);
final TextStyle deleteEdit = TextStyle(
  color: AppColor.introTitleColorBlack,
  fontSize: fontSizeSixteen.spMin,
);
final TextStyle appChatText = TextStyle(
  color: AppColor.appChatColor,
  fontSize: fontSizeEighteen.spMin,
  fontWeight: FontWeight.bold,
);
final TextStyle chatTime = TextStyle(
  color: AppColor.introTitleColorBlack,
  fontSize: fontSizeTen.spMin,
);
final TextStyle category = TextStyle(
  color: AppColor.categoryScreen,
  fontSize: 10.spMin,
);
