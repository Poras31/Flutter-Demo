import 'package:chat_ui_demo/ui/hive_datase/models/notes_model.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<NotesModel> getData() => Hive.box<NotesModel>('notes');
}
