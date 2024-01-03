import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:permission_handler/permission_handler.dart';

@RoutePage()
class PermissionDemoScreen extends StatefulWidget {
  const PermissionDemoScreen({Key? key}) : super(key: key);

  @override
  State<PermissionDemoScreen> createState() => _PermissionDemoScreenState();
}

class _PermissionDemoScreenState extends State<PermissionDemoScreen> {
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  bool valuefirst = false;
  bool valuesecond = false;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
        AutoRouter.of(context).push(const EditProfileRoute());
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  bool permissionGranted = false;
  bool permissionCameraGranted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainBody(),
    );
  }

  Widget mainBody() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              //here permission dialog code
              _getStoragePermission();
            },
            child: const Text(
              'Storage Permission',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              //here permission dialog code
              _getCameraPermission();
            },
            child: const Text(
              'Camera Permission',
            ),
          ),
          10.h.verticalSpace,
          //switch
          Switch(
            onChanged: toggleSwitch,
            value: isSwitched,
            activeColor: Colors.blue,
            activeTrackColor: Colors.yellow,
            inactiveThumbColor: Colors.redAccent,
            inactiveTrackColor: Colors.orange,
          ),
          10.h.verticalSpace,
          Text(
            textValue,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          10.h.verticalSpace,
          //table (table row and column)
          Table(
            defaultColumnWidth: const FixedColumnWidth(120.0),
            border: TableBorder.all(
              color: Colors.black,
              style: BorderStyle.solid,
              width: 2,
            ),
            children: const [
              TableRow(
                children: [
                  Column(
                    children: [
                      Text(
                        'Company',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Tech',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Review',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                ],
              ),
              TableRow(
                children: [
                  Column(children: [Text('Hyperlink')]),
                  Column(children: [Text('Flutter')]),
                  Column(children: [Text('5*')]),
                ],
              ),
              TableRow(
                children: [
                  Column(children: [Text('Hyperlink')]),
                  Column(children: [Text('Android')]),
                  Column(children: [Text('5*')]),
                ],
              ),
            ],
          ),
          15.h.verticalSpace,
          //check box tile
          Container(
            padding: const EdgeInsets.all(
              22.0,
            ),
            child: Column(
              children: [
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Checkbox with Header and Subtitle',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                CheckboxListTile(
                  value: valuefirst,
                  secondary: const Icon(Icons.alarm),
                  onChanged: (value) {
                    setState(() {
                      valuefirst = value!;
                    });
                  },
                  title: const Text('Ringing at 4:30 AM every day'),
                  subtitle: const Text('Ringing after 12 hours'),
                ),
              ],
            ),
          ),
          // image sliders
          10.h.verticalSpace,
          Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(5.0),
            alignment: Alignment.center,
            constraints: const BoxConstraints.expand(
              height: 225,
            ),
            child: imageSliders(context),
          ),
        ],
      ),
    );
  }

  Future _getStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
      setState(() {
        permissionGranted = true;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please accept storage permission'),
          ),
        );
      });
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage.request().isDenied) {
      setState(() {
        permissionGranted = false;
      });
    }
  }

  Future _getCameraPermission() async {
    if (await Permission.camera.request().isGranted) {
      setState(
        () {
          permissionCameraGranted = true;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('accept camera permission '),
            ),
          );
        },
      );
    } else if (await Permission.camera.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.camera.request().isDenied) {
      setState(() {
        permissionCameraGranted = false;
      });
    }
  }

  Swiper imageSliders(BuildContext context) {
    return Swiper(
      itemCount: 10,
      autoplay: false,
      itemBuilder: (context, index) {
        /* return Image.network(
          "https://lh3.googleusercontent.com/wIcl3tehFmOUpq-Jl3hlVbZVFrLHePRtIDWV5lZwBVDr7kEAgLTChyvXUclMVQDRHDEcDhY=w640-h400-e365-rj-sc0x00ffffff",
          fit: BoxFit.fitHeight,
        );*/
        return GestureDetector(
          onTap: () {
            // this is for click event function
            print(index);
          },
          child: Image.network(
            "https://lh3.googleusercontent.com/wIcl3tehFmOUpq-Jl3hlVbZVFrLHePRtIDWV5lZwBVDr7kEAgLTChyvXUclMVQDRHDEcDhY=w640-h400-e365-rj-sc0x00ffffff",
            fit: BoxFit.fitHeight,
          ),
        );
      },
      viewportFraction: 0.7,
      scale: 0.8,
    );
  }
}
