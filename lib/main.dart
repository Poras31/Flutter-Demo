import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/ui/hive_datase/models/notes_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'app_router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directoryPath = await getApplicationDocumentsDirectory();
  Hive.init(directoryPath.path);
  Hive.registerAdapter(NotesModelAdapter());
  await Hive.openBox<NotesModel>('notes');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final _appRouter = AppRouter();

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp.router(
        title: 'Huge Basket',
        theme: ThemeData(
          drawerTheme: const DrawerThemeData(
            scrimColor: Colors.transparent,
          ),
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}

@RoutePage()
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: const Color(0xFF171717),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        _globalKey.currentState!.openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 10),
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Messages",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Online",
                        style: TextStyle(color: Colors.grey, fontSize: 25),
                      ),
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Groups",
                        style: TextStyle(color: Colors.grey, fontSize: 25),
                      ),
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "More",
                        style: TextStyle(color: Colors.grey, fontSize: 25),
                      ),
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: 190,
            left: 0,
            right: 0,
            child: Container(
              height: 220,
              padding: const EdgeInsets.only(top: 15, left: 25, right: 25),
              decoration: const BoxDecoration(
                color: Color(0XFF27c1a9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Favourite Contacts',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 90,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        //buildContactAvatar('Om', Assets.imagesImageOne),
                        buildContactAvatar('One', 'image_one.png'),
                        buildContactAvatar('Two', 'image_one.png'),
                        buildContactAvatar('Three', 'image_one.png'),
                        buildContactAvatar('Four', 'image_one.png'),
                        buildContactAvatar('Five', 'image_one.png'),
                        buildContactAvatar('SIx', 'image_one.png'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 365,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: ListView(
                padding: const EdgeInsets.only(
                  left: 25,
                ),
                children: [
                  buildConversationRow(
                    'Om',
                    'Hello , How are you ?',
                    'image_one.png',
                    1,
                  ),
                  buildConversationRow(
                    'One',
                    'Hello , How are you ?',
                    'image_one.png',
                    0,
                  ),
                  buildConversationRow(
                    'Two',
                    'Hello , How are you ?',
                    'image_one.png',
                    2,
                  ),
                  buildConversationRow(
                    'Three',
                    'Hello , How are you ?',
                    'image_one.png',
                    3,
                  ),
                  buildConversationRow(
                    'Four',
                    'Hello , How are you ?',
                    'image_one.png',
                    4,
                  ),
                  buildConversationRow(
                    'Five',
                    'Hello , How are you ?',
                    'image_one.png',
                    5,
                  ),
                  buildConversationRow(
                    'Six',
                    'Hello , How are you ?',
                    'image_one.png',
                    6,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: SizedBox(
        height: 60,
        width: 60,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.green,
          child: const Icon(
            Icons.edit_outlined,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
      drawer: Drawer(
        width: 275,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(40),
          ),
        ),
        backgroundColor: Colors.black26,
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0XF71F1F1F),
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(40),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0x03d00000),
                spreadRadius: 30,
                blurRadius: 20,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(
                          width: 56,
                        ),
                        Text(
                          'Settings',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    const Row(
                      children: [
                        UserAvatar(filename: "image_one.png"),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Poras Raval",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    DrawerItem(
                      title: 'Account',
                      smallIcon: Icons.key,
                      onTap: () {
                        Fluttertoast.showToast(
                          msg: "Account",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      },
                    ),
                    DrawerItem(
                      title: 'Chat',
                      smallIcon: Icons.chat_bubble,
                      onTap: () {
                        /*Fluttertoast.showToast(
                          msg: "Chat",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );*/
                        Navigator.of(context).pop(); //this is for close drawer.
                        AutoRouter.of(context).push(const BottomMenuRoute());
                      },
                    ),
                    DrawerItem(
                      title: 'Notifications',
                      smallIcon: Icons.notifications,
                      onTap: () {
                        Fluttertoast.showToast(
                          msg: "Notification",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      },
                    ),
                    DrawerItem(
                      title: 'Data and Storage',
                      smallIcon: Icons.storage,
                      onTap: () {
                        Fluttertoast.showToast(
                          msg: "Data and Storage",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                        Navigator.of(context).pop(); //this is for close drawer.
                        AutoRouter.of(context).push(const IntroRouteRoute());
                      },
                    ),
                    DrawerItem(
                      title: 'Help',
                      smallIcon: Icons.help,
                      onTap: () {
                        Fluttertoast.showToast(
                          msg: "Help",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      },
                    ),
                    const Divider(
                      height: 35,
                      color: Colors.green,
                    ),
                    DrawerItem(
                      title: 'Invite a Friends',
                      smallIcon: Icons.people_outline,
                      onTap: () {
                        Navigator.of(context).pop(); //this is for close drawer.
                        Fluttertoast.showToast(
                          msg: "Invite a Friends",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      },
                    ),
                  ],
                ),
                DrawerItem(
                  title: 'Log Out',
                  smallIcon: Icons.logout_outlined,
                  onTap: () {
                    Fluttertoast.showToast(
                      msg: "Log Out",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildConversationRow(
      String name, String message, String fileName, int msgCount) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                UserAvatar(
                  filename: fileName,
                ),
                const SizedBox(
                  width: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      message,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 25,
                top: 5,
              ),
              child: Column(
                children: [
                  const Text(
                    '5:59',
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  if (msgCount > 0)
                    CircleAvatar(
                      radius: 7,
                      backgroundColor: Colors.green,
                      child: Text(
                        msgCount.toString(),
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        const Divider(
          indent: 70,
        ),
      ],
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData smallIcon;
  final VoidCallback? onTap; //callback function
  const DrawerItem({
    super.key,
    required this.title,
    required this.smallIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Row(
          children: [
            Icon(
              smallIcon,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(
              width: 56,
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Padding buildContactAvatar(String name, String filename) {
  return Padding(
    padding: const EdgeInsets.only(right: 20.0),
    child: Column(
      children: [
        UserAvatar(
          filename: filename,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    ),
  );
}

class UserAvatar extends StatelessWidget {
  final String filename;
  const UserAvatar({
    super.key,
    required this.filename,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 32,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 29,
        backgroundImage: Image.asset('assets/images/$filename').image,
      ),
    );
  }
}
