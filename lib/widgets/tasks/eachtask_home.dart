import 'package:flutter/material.dart';
import 'package:todolist/data/home/task_home_db.dart';

class EachTaskHome extends StatefulWidget {
  final String name;
  final String about;
  const EachTaskHome({required this.name, required this.about, super.key});

  @override
  State<EachTaskHome> createState() => _EachTaskHomeState();
}

class _EachTaskHomeState extends State<EachTaskHome> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
        child: const Align(
          alignment: Alignment(-0.9, 0),
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ),
      onDismissed: (direction) {
        TaskHomeDao().delete(widget.name);
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Anotação excluída!')));
      },
      child: Container(
        color: Colors.blue[100],
        child: ListTile(
          title: Text(widget.name),
          subtitle: Text(widget.about),
          leading: const Icon(Icons.star),
        ),
      ),
    );
  }
}
