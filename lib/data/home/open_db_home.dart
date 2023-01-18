import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todolist/data/home/task_home_db.dart';

Future<Database> getDataBaseHome() async {
  final String path = join(await getDatabasesPath() , 'taskhome.db');
  return openDatabase(path,
      onCreate: ((db, version) => db.execute(TaskHomeDao.taskhomedatabase)), version: 1);
}
