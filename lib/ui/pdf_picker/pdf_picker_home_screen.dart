import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/ui/utils/base_app_bar.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class PDFPickerHomeScreen extends StatefulWidget {
  const PDFPickerHomeScreen({Key? key}) : super(key: key);

  @override
  State<PDFPickerHomeScreen> createState() => _PDFPickerHomeScreenState();
}

class _PDFPickerHomeScreenState extends State<PDFPickerHomeScreen> {
  FilePickerResult? result;
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
        "PDF Picker",
        style: verificationTitle,
      ),
      elevations: 4,
      shadowColor: AppColor.baseAppBar,
    );
  }

  Widget mainBody() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (result != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Selected file:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  12.h.verticalSpace,
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: result?.files.length ?? 0,
                    itemBuilder: (context, index) {
                      print("item count ${result?.files.length}");
                      return Text(
                        result?.files[index].name ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return 5.h.verticalSpace;
                    },
                  ),
                ],
              ),
            ),
          const Spacer(
            flex: 3,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                result = await FilePicker.platform.pickFiles(
                  allowMultiple: false,
                );
                if (result == null) {
                  print("No file selected");
                } else {
                  setState(() {});
                  for (var element in result!.files) {
                    print("Path ${element.name}");
                  }
                }
              },
              child: const Text("File Picker"),
            ),
          ),
        ],
      ),
    );
  }
}
