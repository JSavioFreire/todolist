import 'package:flutter/material.dart';
import 'package:todolist/data/pay/task_pay_db.dart';
import 'package:todolist/widgets/listTile/list_pay.dart';
import 'package:todolist/widgets/tasks/eachtask_payed.dart';

import '../../data/payed/task_payed_db.dart';

class EachTaskPay extends StatefulWidget {
  final String name;
  final String about;
  final String value;
  final String venc;
  const EachTaskPay(
      {required this.name,
      required this.about,
      super.key,
      required this.value,
      required this.venc});

  @override
  State<EachTaskPay> createState() => _EachTaskPayState();
}

class _EachTaskPayState extends State<EachTaskPay> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.green,
          child: const Align(
            alignment: Alignment(-0.9, 0),
            child: Icon(Icons.money_off, size: 35, color: Colors.white),
          ),
        ),
        secondaryBackground: Container(
          color: Colors.red,
          child: const Align(
            alignment: Alignment(0.9, 0),
            child: Icon(Icons.delete, size: 30, color: Colors.white),
          ),
        ),
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.endToStart) {
            return await showDialog(
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
          } else if (direction == DismissDirection.startToEnd) {
            return await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Você tem certeza?'),
                content: const Text(
                  'Você deseja mesmo marcar essa conta como paga?',
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
          }
          return null;
        },
        onDismissed: (direction) {
          if (direction == DismissDirection.endToStart) {
            TaskPayDao().delete(widget.name);
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Conta excluída!')));
          } else if (direction == DismissDirection.startToEnd) {
            TaskPayDao().delete(widget.name);
            TaskPayedDao().save(EachTaskPayed(
              name: widget.name,
              about: widget.about,
              value: widget.value,
              venc: widget.venc,
            ));
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Conta paga!')));
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
