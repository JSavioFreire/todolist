import 'package:flutter/material.dart';
import 'package:todolist/data/home/task_home_db.dart';

class EachTaskScreen extends StatelessWidget {
  final String title;
  final String about;

  const EachTaskScreen({super.key, required this.title, required this.about});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vizualizando anotações')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Título:',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              Text(
                title,
                style: TextStyle(fontSize: 24, color: Colors.grey[900]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Descrição:',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ),
              Text(
                about,
                style: TextStyle(fontSize: 17, color: Colors.grey[900]),
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 8,
              ),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    size: 40,
                    color: Colors.white,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 8,
              ),
              child: IconButton(
                  onPressed: () {
                    TaskHomeDao().delete(title);
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.delete,
                    size: 40,
                    color: Colors.white,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
