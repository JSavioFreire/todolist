import 'package:flutter/material.dart';
import 'package:todolist/data/pay/task_pay_db.dart';
import 'package:todolist/data/payed/task_payed_db.dart';
import 'package:todolist/widgets/listTile/list_pay.dart';

class EachTaskPayed extends StatefulWidget {
  final String name;
  final String about;
  final String value;
  final String venc;
  const EachTaskPayed(
      {required this.name,
      required this.about,
      super.key,
      required this.value,
      required this.venc});

  @override
  State<EachTaskPayed> createState() => _EachTaskPayedState();
}

class _EachTaskPayedState extends State<EachTaskPayed> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
          child: const Align(
            alignment: Alignment(0.9, 0),
            child: Icon(Icons.delete, size: 30, color: Colors.white),
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
            TaskPayedDao().delete(widget.name);
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Conta excluída!')));
          }
        },
        child: ListPay(
          title: widget.name,
          about: widget.about,
          value: widget.value,
          venc: widget.venc,
        ));
  }
}
