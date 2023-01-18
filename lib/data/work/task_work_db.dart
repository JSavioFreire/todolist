import 'package:sqflite/sqflite.dart';
import '../../widgets/tasks/eachtask_work.dart';
import 'open_db_work.dart';

class TaskWorkDao {
  static const String taskhomedatabase = 'CREATE TABLE $tableName('
      '$name TEXT, '
      '$client TEXT, '
      '$date TEXT, '
      '$about TEXT)';

  static const tableName = 'taskHomeTable';

  static const String name = 'name';
  static const String about = 'about';
  static const String client = 'client';
  static const String date = 'date';

  save(EachTaskWork newTask) async {
    final Database dataBase = await getDataBaseWork();
    Map<String, dynamic> newTaskMap = toMap(newTask);
    return await dataBase.insert(tableName, newTaskMap);
  }

  Future<List<EachTaskWork>> findAll() async {
    final Database dataBase = await getDataBaseWork();
    final List<Map<String, dynamic>> result = await dataBase.query(tableName);
    return toList(result);
  }

  delete(String taskName) async {
    final Database dataBase = await getDataBaseWork();
    return dataBase.delete(
      tableName,
      where: '$name = ?',
      whereArgs: [taskName],
    );
  }

  Map<String, dynamic> toMap(EachTaskWork eachTask) {
    final Map<String, dynamic> taskMap = {};
    taskMap[name] = eachTask.name;
    taskMap[about] = eachTask.about;
    taskMap[client] = eachTask.client;
    taskMap[date] = eachTask.date;
    return taskMap;
  }

  List<EachTaskWork> toList(List<Map<String, dynamic>> taskMap) {
    final List<EachTaskWork> taskList = [];
    for (Map<String, dynamic> eachTask in taskMap) {
      final EachTaskWork tasks = EachTaskWork(
        name: eachTask['name'],
        about: eachTask['about'],
        client: eachTask['client'],
        date: eachTask['date'],
      );
      taskList.add(tasks);
    }
    return taskList;
  }
}
