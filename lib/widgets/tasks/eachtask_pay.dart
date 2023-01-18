import 'package:flutter/material.dart';
import 'package:todolist/data/pay/task_pay_db.dart';
import 'package:todolist/widgets/listTile/list_pay.dart';

class EachTaskPay extends StatefulWidget {
  final String name;
  final String about;
  final String value;
  final String venc;
  const EachTaskPay({required this.name, required this.about, super.key, required this.value, required this.venc});

  @override
  State<EachTaskPay> createState() => _EachTaskPayState();
}

class _EachTaskPayState extends State<EachTaskPay> {
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
          TaskPayDao().delete(widget.name);
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Anotação excluída!')));
        },
        child: ListPay(
            title: widget.name,
            about: widget.about,
            value: widget.value,
            venc: widget.venc));
  }
}
