import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/ui/hive_datase/boxes/boxes.dart';
import 'package:chat_ui_demo/ui/hive_datase/models/notes_model.dart';
import 'package:chat_ui_demo/ui/utils/base_app_bar.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

@RoutePage()
class HiveHomeScreen extends StatefulWidget {
  const HiveHomeScreen({Key? key}) : super(key: key);

  @override
  State<HiveHomeScreen> createState() => _HiveHomeScreenState();
}

class _HiveHomeScreenState extends State<HiveHomeScreen> {
  late final TextEditingController titleController, descriptionController;

  @override
  void initState() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text(
          'Hive Database',
          style: verificationTitle,
        ),
        elevations: 4,
        shadowColor: AppColor.baseAppBar,
      ),
      /*body: Column(
        children: [
          FutureBuilder(
            future: Hive.openBox('AppDb'),
            builder: (context, snapshot) {
              return Column(
                children: [
                  Text(snapshot.data!.get('name').toString()),
                  Text(snapshot.data!.get('age').toString()),
                  Text(snapshot.data!.get('details').toString()),
                ],
              );
            },
          ),
        ],
      ),*/
      body: ValueListenableBuilder<Box<NotesModel>>(
        builder: (context, box, _) {
          var dataList = box.values.toList().cast<NotesModel>();
          return ListView.builder(
            shrinkWrap: true,
            reverse: true,
            physics: const BouncingScrollPhysics(),
            itemCount: box.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 10.0,
                  ).r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            dataList[index].title.toString(),
                            style: TextStyle(
                              fontSize: 15.sm,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              _editShowDialog(
                                dataList[index],
                                dataList[index].title.toString(),
                                dataList[index].description.toString(),
                              );
                            },
                            child: const Icon(Icons.edit),
                          ),
                          15.w.horizontalSpace,
                          InkWell(
                            onTap: () {
                              deleteNote(dataList[index]);
                            },
                            child: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        dataList[index].description.toString(),
                        style: TextStyle(
                          fontSize: 15.sm,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        valueListenable: Boxes.getData().listenable(),
      ),
      floatingActionButton: FloatingActionButton(
        /*onPressed: () async {
          // code for on press
          var box = await Hive.openBox('AppDb');
          box.put('name', 'Poras Raval');
          box.put('age', 24);
          box.put('details', {
            'profession': "developer",
            'exp': 1.9,
          });
          print(box.get('name'));
          print(box.get('age'));
          print(box.get('details'));
        },*/
        onPressed: () async {
          //data insert code
          _showDialog();
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  Future<void> _showDialog() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Notes'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    hintText: 'Enter title',
                    border: OutlineInputBorder(),
                  ),
                ),
                15.h.verticalSpace,
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    hintText: 'Enter description',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                //navigation to go back
                AutoRouter.of(context).pop();
              },
              child: const Text(
                'Cancel',
              ),
            ),
            TextButton(
              onPressed: () {
                if (titleController.text.isEmpty &&
                    descriptionController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter details'),
                    ),
                  );
                } else {
                  // this is for print added title and description
                  /*setState(() {
                    print("Title ${titleController.text.toString()}");
                    print(
                        "Description ${descriptionController.text.toString()}");
                  });*/
                  //navigation to go back
                  final data = NotesModel(
                    title: titleController.text,
                    description: descriptionController.text,
                  );

                  final box = Boxes.getData();
                  box.add(data);
                  data.save();
                  titleController.clear();
                  descriptionController.clear();

                  AutoRouter.of(context).pop();
                }
              },
              child: const Text(
                'Add',
              ),
            ),
          ],
        );
      },
    );
  }

  void deleteNote(NotesModel notesModel) async {
    await notesModel.delete();
  }

  Future<void> _editShowDialog(
    NotesModel notesModel,
    String editTitle,
    String editDescription,
  ) async {
    titleController.text = editTitle;
    descriptionController.text = editDescription;

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Notes'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    hintText: 'Enter title',
                    border: OutlineInputBorder(),
                  ),
                ),
                15.h.verticalSpace,
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    hintText: 'Enter description',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                //navigation to go back
                AutoRouter.of(context).pop();
              },
              child: const Text(
                'Cancel',
              ),
            ),
            TextButton(
              onPressed: () async {
                if (titleController.text.isEmpty &&
                    descriptionController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter details'),
                    ),
                  );
                } else {
                  //navigation to go back after edited data

                  notesModel.title = titleController.text.toString();
                  notesModel.description =
                      descriptionController.text.toString();

                  notesModel.save();
                  titleController.clear();
                  descriptionController.clear();

                  await AutoRouter.of(context).pop();
                }
              },
              child: const Text(
                'Edit',
              ),
            ),
          ],
        );
      },
    );
  }
}
