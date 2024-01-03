import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/generated/assets.dart';
import 'package:chat_ui_demo/ui/dashboard/recent_chat/recent_chat_model.dart';
import 'package:chat_ui_demo/ui/dashboard/recent_chat/recent_chat_widget.dart';
import 'package:chat_ui_demo/ui/utils/base_app_bar.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RecentChatScreen extends StatefulWidget {
  const RecentChatScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RecentChatScreenState();
}

class _RecentChatScreenState extends State<RecentChatScreen> {
  List<RecentChatModel> recentChatModel = [
    RecentChatModel(
      personName: 'Walmart',
      personImage: Assets.commonWalmart,
      chatTime: '5 min',
      chatDescription:
          'Next Time we will provide best service with same product',
      counter: true,
    ),
    RecentChatModel(
      personName: 'Stop & Shop',
      personImage: Assets.productStoreStopShop,
      chatTime: '5 min',
      chatDescription:
          "I really find the subject very Interesting. I'm enjoying all my..",
      counter: true,
    ),
    RecentChatModel(
      personName: 'John',
      personImage: Assets.productStoreSafeway,
      chatTime: '10 min',
      chatDescription:
          "I really find the subject very Interesting. I'm enjoying all my..",
      counter: false,
    ),
    RecentChatModel(
      personName: 'zeearson',
      personImage: Assets.productStoreGiantFoodStores,
      chatTime: '10 min',
      chatDescription:
          "I really find the subject very Interesting. I'm enjoying all my..",
      counter: false,
    ),
    RecentChatModel(
      personName: 'Kartain Killer',
      personImage: Assets.productStoreMeijer,
      chatTime: '10 min',
      chatDescription:
          "I really find the subject very Interesting. I'm enjoying all my..",
      counter: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBaseAppBar(),
      body: mainBody(),
    );
  }

  BaseAppBar buildBaseAppBar() {
    return BaseAppBar(
      title: Text(
        'Recent Chat',
        style: verificationTitle,
      ),
      elevations: 4,
      shadowColor: AppColor.baseAppBar,
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

  Widget mainBody() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemCount: recentChatModel.length,
            itemBuilder: (context, index) {
              final RecentChatModel item = recentChatModel[index];
              return RecentChatWidget(
                recentChatModel: item,
              );
            },
          ),
        ),
      ],
    );
  }
}
