import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todolist/data/work/task_work_db.dart';

Future<Database> getDataBaseWork() async {
  final String path = join(await getDatabasesPath(), 'taskwork.db');
  return openDatabase(path,
      onCreate: ((db, version) => db.execute(TaskWorkDao.taskhomedatabase)),
      version: 1);
}