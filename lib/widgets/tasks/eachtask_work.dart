import 'package:flutter/material.dart';
import 'package:todolist/data/work/task_work_db.dart';
import 'package:todolist/widgets/listTile/list_work.dart';

class EachTaskWork extends StatefulWidget {
  final String name;
  final String about;
  final String client;
  final String date;
  const EachTaskWork(
      {required this.name,
      required this.about,
      super.key,
      required this.client,
      required this.date});

  @override
  State<EachTaskWork> createState() => _EachTaskState();
}

class _EachTaskState extends State<EachTaskWork> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
          child: const Align(
            alignment: Alignment(0.9, 0),
            child: Icon(Icons.delete, color: Colors.white),
          ),
        ),
        direction: DismissDirection.endToStart,
        confirmDismiss: (direction) {
          return showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Você tem certeza?'),
              content: const Text(
                'Você deseja mesmo deletar essa anotação?',
              ),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text('Não'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                ElevatedButton(
                  child: const Text('Sim'),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            ),
          );
        },
        onDismissed: (direction) {
          if (direction == DismissDirection.endToStart) {
            TaskWorkDao().delete(widget.name);
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Anotação excluída!')));
          }
        },
        child: ListWork(
            title: widget.name,
            about: widget.about,
            client: widget.client,
            date: widget.date));
  }
}
