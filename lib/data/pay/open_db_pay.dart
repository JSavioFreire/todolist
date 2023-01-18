import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todolist/data/pay/task_pay_db.dart';

Future<Database> getDataBasePay() async {
  final String path = join(await getDatabasesPath(), 'taskPayment.db');
  return openDatabase(path,
      onCreate: ((db, version) => db.execute(TaskPayDao.database)), version: 1);
}
