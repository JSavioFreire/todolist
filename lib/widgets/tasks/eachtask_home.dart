import 'package:flutter/material.dart';
import 'package:todolist/data/home/task_home_db.dart';
import 'package:todolist/widgets/listTile/list_home.dart';

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
        onDismissed: (directions) {
          TaskHomeDao().delete(widget.name);
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Anotação excluída!')));
        },
        child: ListHome(name: widget.name, about: widget.about));
  }
}
