import 'package:sqflite/sqflite.dart';
import 'package:todolist/widgets/tasks/eachtask_home.dart';
import 'open_db_home.dart';

class TaskHomeDao {
  static const String database = 'CREATE TABLE $tableName('
      '$name TEXT, '
      '$about TEXT)';

  static const tableName = 'taskHomeTable';

  static const String name = 'name';
  static const String about = 'about';

  save(EachTaskHome newTask) async {
    final Database dataBase = await getDataBaseHome();
    Map<String, dynamic> newTaskMap = toMap(newTask);
    return await dataBase.insert(tableName, newTaskMap);
  }

  Future<List<EachTaskHome>> findAll() async {
    final Database dataBase = await getDataBaseHome();
    final List<Map<String, dynamic>> result = await dataBase.query(tableName);
    return toList(result);
  }

  delete(String taskName) async {
    final Database dataBase = await getDataBaseHome();
    return dataBase.delete(
      tableName,
      where: '$name = ?',
      whereArgs: [taskName],
    );
  }

  Map<String, dynamic> toMap(EachTaskHome eachTask) {
    final Map<String, dynamic> taskMap = {};
    taskMap[name] = eachTask.name;
    taskMap[about] = eachTask.about;
    return taskMap;
  }

  List<EachTaskHome> toList(List<Map<String, dynamic>> taskMap) {
    final List<EachTaskHome> taskList = [];
    for (Map<String, dynamic> eachTask in taskMap) {
      final EachTaskHome tasks =
          EachTaskHome(name: eachTask['name'], about: eachTask['about']);
      taskList.add(tasks);
    }
    return taskList;
  }
}
