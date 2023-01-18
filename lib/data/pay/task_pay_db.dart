import 'package:sqflite/sqflite.dart';
import 'package:todolist/data/pay/open_db_pay.dart';
import 'package:todolist/widgets/tasks/eachtask_pay.dart';

class TaskPayDao {
  static const String database = 'CREATE TABLE $tableName('
      '$name TEXT, '
      '$venc TEXT, '
      '$value TEXT, '
      '$about TEXT)';

  static const tableName = 'taskHomeTable';

  static const String name = 'name';
  static const String about = 'about';
  static const String venc = 'venc';
  static const String value = 'value';

  save(EachTaskPay newTask) async {
    final Database dataBase = await getDataBasePay();
    Map<String, dynamic> newTaskMap = toMap(newTask);
    return await dataBase.insert(tableName, newTaskMap);
  }

  Future<List<EachTaskPay>> findAll() async {
    final Database dataBase = await getDataBasePay();
    final List<Map<String, dynamic>> result = await dataBase.query(tableName);
    return toList(result);
  }

  delete(String taskName) async {
    final Database dataBase = await getDataBasePay();
    return dataBase.delete(
      tableName,
      where: '$name = ?',
      whereArgs: [taskName],
    );
  }

  Map<String, dynamic> toMap(EachTaskPay eachTask) {
    final Map<String, dynamic> taskMap = {};
    taskMap[name] = eachTask.name;
    taskMap[about] = eachTask.about;
    taskMap[venc] = eachTask.venc;
    taskMap[value] = eachTask.value;
    return taskMap;
  }

  List<EachTaskPay> toList(List<Map<String, dynamic>> taskMap) {
    final List<EachTaskPay> taskList = [];
    for (Map<String, dynamic> eachTask in taskMap) {
      final EachTaskPay tasks = EachTaskPay(
        name: eachTask['name'],
        about: eachTask['about'],
        venc: eachTask['venc'],
        value: eachTask['value'],
      );
      taskList.add(tasks);
    }
    return taskList;
  }
}
