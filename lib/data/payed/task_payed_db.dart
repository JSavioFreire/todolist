import 'package:sqflite/sqflite.dart';
import 'package:todolist/data/payed/open_db_payed.dart';
import 'package:todolist/widgets/tasks/eachtask_payed.dart';

class TaskPayedDao {
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

  save(EachTaskPayed newTask) async {
    final Database dataBase = await getDataBasePayed();
    Map<String, dynamic> newTaskMap = toMap(newTask);
    return await dataBase.insert(tableName, newTaskMap);
  }

  Future<List<EachTaskPayed>> findAll() async {
    final Database dataBase = await getDataBasePayed();
    final List<Map<String, dynamic>> result = await dataBase.query(tableName);
    return toList(result);
  }

  delete(String taskName) async {
    final Database dataBase = await getDataBasePayed();
    return dataBase.delete(
      tableName,
      where: '$name = ?',
      whereArgs: [taskName],
    );
  }

  Map<String, dynamic> toMap(EachTaskPayed eachTask) {
    final Map<String, dynamic> taskMap = {};
    taskMap[name] = eachTask.name;
    taskMap[about] = eachTask.about;
    taskMap[venc] = eachTask.venc;
    taskMap[value] = eachTask.value;
    return taskMap;
  }

  List<EachTaskPayed> toList(List<Map<String, dynamic>> taskMap) {
    final List<EachTaskPayed> taskList = [];
    for (Map<String, dynamic> eachTask in taskMap) {
      final EachTaskPayed tasks = EachTaskPayed(
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
