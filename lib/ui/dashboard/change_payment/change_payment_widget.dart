import 'package:chat_ui_demo/ui/dashboard/change_payment/chnage_payment_model.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePaymentWidget extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final ChangePaymentModel changePaymentModel;
  const ChangePaymentWidget({
    super.key,
    required this.index,
    required this.changePaymentModel,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0).r,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7).r,
          color: selectedIndex == index
              ? AppColor.changeCard
              : AppColor.introNextColorWhite,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0).r,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(18.0).r,
                color: AppColor.introNextColorWhite,
                child: Image.asset(
                  changePaymentModel.cardImage,
                  height: 50.r,
                  width: 65.r,
                ),
              ),
              5.h.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    changePaymentModel.cardHolderName,
                    style: TextStyle(
                      fontSize: 16.sm,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    changePaymentModel.cardNumber,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sm,
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
