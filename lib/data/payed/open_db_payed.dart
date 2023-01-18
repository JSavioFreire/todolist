import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todolist/data/payed/task_payed_db.dart';

Future<Database> getDataBasePayed() async {
  final String path = join(await getDatabasesPath(), 'taskPayed.db');
  return openDatabase(path,
      onCreate: ((db, version) => db.execute(TaskPayedDao.database)),
      version: 1);
}
