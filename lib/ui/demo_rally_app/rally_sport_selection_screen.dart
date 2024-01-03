import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/generated/assets.dart';
import 'package:chat_ui_demo/ui/demo_rally_app/chip_date.dart';
import 'package:chat_ui_demo/ui/utils/base_app_bar.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class RallySportSelectionScreen extends StatefulWidget {
  const RallySportSelectionScreen({Key? key}) : super(key: key);

  @override
  State<RallySportSelectionScreen> createState() =>
      _RallySportSelectionScreenState();
}

class _RallySportSelectionScreenState extends State<RallySportSelectionScreen> {
  List<ChipData> chipDataList = [
    ChipData(name: 'Chip 1', image: Icons.star),
    ChipData(name: 'Chip 2', image: Icons.access_time),
    ChipData(name: 'Chip 3', image: Icons.favorite),
    ChipData(name: 'Chip 4', image: Icons.star),
  ];

  Set<String> selectedChips = Set();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.black,
      body: mainBody(),
    );
  }

  BaseAppBar buildAppBar() {
    return BaseAppBar(
      backgroundColor: Colors.black,
      title: const Text('Back'),
      elevations: 2,
      leadingWidget: InkWell(
        onTap: () {
          //navigation to go back
        },
        child: const Icon(
          Icons.arrow_back_ios_sharp,
          color: AppColor.introNextColorWhite,
        ),
      ),
    );
  }

  Widget mainBody() {
    return Container(
      padding: const EdgeInsets.all(15.0).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Profile Setup",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.spMin,
              fontWeight: FontWeight.bold,
            ),
          ),
          15.h.verticalSpace,
          Text(
            "We see you’re ready to Rally, Complete your profile to make the most of Rally!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.spMin,
              fontWeight: FontWeight.normal,
            ),
          ),
          25.h.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  // navigation to profile screen
                },
                child: Image.asset(
                  height: 68.h,
                  width: 68.w,
                  Assets.profileKdImage,
                ),
              ),
              20.w.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kylee Danford",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.spMin,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  10.h.verticalSpace,
                  Text(
                    "@kyleedandfordrally",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.spMin,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              )
            ],
          ),
          15.h.verticalSpace,
          Divider(
            color: AppColor.chatBackground2,
            height: 15.r,
          ),
          20.h.verticalSpace,
          Text(
            "Sport Selection",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.spMin,
              fontWeight: FontWeight.bold,
            ),
          ),
          10.verticalSpace,
          Text(
            "Choose up to 2 sports that you play or just love",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.spMin,
              fontWeight: FontWeight.w400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: chipDataList.map((chipData) {
                bool isSelected = selectedChips.contains(chipData.name);
                return ChoiceChip(
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(chipData.image, color: Colors.grey),
                      SizedBox(width: 4.0),
                      Text(chipData.name),
                    ],
                  ),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        // Limit selection to 2 chips
                        if (selectedChips.length < 2) {
                          selectedChips.add(chipData.name);
                        }
                      } else {
                        selectedChips.remove(chipData.name);
                      }
                    });
                  },
                  selectedColor: Colors.yellow,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.yellowAccent : Colors.grey,
                  ),
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: isSelected ? Colors.yellowAccent : Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
