import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/generated/assets.dart';
import 'package:chat_ui_demo/ui/utils/base_app_bar.dart';
import 'package:chat_ui_demo/ui/utils/text_form_filed.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/dimens.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBaseAppBar(),
      body: mainBody(),
    );
  }

  Widget mainBody() {
    return Padding(
      padding: const EdgeInsets.all(15.0).r,
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: Text(
                    '05 April',
                    style: orderTime.copyWith(
                      color: AppColor.introTitleColorBlack,
                    ),
                  ),
                ),
                24.h.verticalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                        right: 27,
                        left: 27,
                      ).r,
                      decoration: BoxDecoration(
                        color: AppColor.chatBackground.withOpacity(0.2),
                        borderRadius: BorderRadius.only(
                          bottomLeft: const Radius.circular(19).r,
                          bottomRight: const Radius.circular(0).r,
                          topRight: const Radius.circular(19).r,
                          topLeft: const Radius.circular(19).r,
                        ),
                      ),
                      child: Text(
                        'Can you help me ?',
                        style: orderTime.copyWith(
                          color: AppColor.introTitleColorBlack,
                        ),
                      ),
                    ),
                    10.h.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '5:20 am',
                          style: chatTime,
                        ),
                        10.w.horizontalSpace,
                        Container(
                          height: 4.r,
                          width: 4.r,
                          decoration: const BoxDecoration(
                            color: AppColor.greenColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        3.w.horizontalSpace,
                        Container(
                          height: 4.r,
                          width: 4.r,
                          decoration: const BoxDecoration(
                            color: AppColor.greenColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                14.h.verticalSpace,
                Text(
                  'Today',
                  style: chatTime,
                ),
                20.h.verticalSpace,
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(31, 14, 31, 10).r,
                    decoration: BoxDecoration(
                      color: AppColor.chatBackground2,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        topLeft: Radius.circular(19),
                        topRight: Radius.circular(19),
                        bottomRight: Radius.circular(19),
                      ).r,
                    ),
                    child: Text(
                      'Yes, sure',
                      style: orderTime.copyWith(
                        color: AppColor.introTitleColorBlack,
                      ),
                    ),
                  ),
                ),
                10.h.verticalSpace,
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '5:20 am',
                    style: chatTime,
                  ),
                ),
                5.h.verticalSpace,
                Container(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    right: 27,
                    left: 27,
                  ).r,
                  decoration: BoxDecoration(
                    color: AppColor.chatBackground.withOpacity(0.2),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(19),
                      topLeft: Radius.circular(19),
                      topRight: Radius.circular(19),
                      bottomRight: Radius.circular(0),
                    ).r,
                  ),
                  child: Text(
                    'How can I find the product details please asked me so I will use it?',
                    style: orderTime.copyWith(
                      color: AppColor.introTitleColorBlack,
                    ),
                  ),
                ),
                5.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '5:23 am',
                      style: chatTime,
                    ),
                    12.w.horizontalSpace,
                    Container(
                      height: 4.r,
                      width: 4.r,
                      decoration: const BoxDecoration(
                        color: AppColor.greenColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    3.w.horizontalSpace,
                    Container(
                      height: 4.r,
                      width: 4.r,
                      decoration: const BoxDecoration(
                        color: AppColor.greenColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
                15.h.verticalSpace,
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(31, 14, 31, 10).r,
                    decoration: BoxDecoration(
                      color: AppColor.chatBackground.withOpacity(0.2),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        topLeft: Radius.circular(19),
                        topRight: Radius.circular(19),
                        bottomRight: Radius.circular(19),
                      ).r,
                    ),
                    child: Text(
                      'When you see it ?',
                      style: orderTime.copyWith(
                        color: AppColor.introTitleColorBlack,
                      ),
                    ),
                  ),
                ),
                10.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '5:20 am',
                      style: chatTime,
                    ),
                    12.w.horizontalSpace,
                    Container(
                      height: 4.r,
                      width: 4.r,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.hintText,
                      ),
                    ),
                  ],
                ),
                30.h.verticalSpace,

                ///typing text layout
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: AppTextField(
                        hint: 'message',
                        prefixIcon: InkWell(
                          onTap: () {
                            //for record record message
                          },
                          child: const Icon(
                            Icons.mic,
                            color: AppColor.verticalDivider,
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Container(
                            padding: const EdgeInsets.all(4).r,
                            decoration: const BoxDecoration(
                              color: AppColor.introTitleColorBlack,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 25.r,
                            ),
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(
                          left: fontSizeTwelve,
                        ).r,
                        keyboardAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        filled: true,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        //code for add message in list
                      },
                      icon: Image.asset(
                        Assets.profileSend,
                        height: 48.r,
                        width: 48.r,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  BaseAppBar buildBaseAppBar() {
    return BaseAppBar(
      title: Row(
        children: [
          Image.asset(
            Assets.commonWalmart,
            height: 38.r,
            width: 38.r,
          ),
          10.w.horizontalSpace,
          Text(
            'Walmart',
            style: appChatText,
          ),
        ],
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
    );
  }
}
