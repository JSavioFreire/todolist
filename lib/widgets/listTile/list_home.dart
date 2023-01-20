import 'package:flutter/material.dart';
import 'package:todolist/screens/each_task/each_task_screen.dart';

class ListHome extends StatelessWidget {
  final String name;
  final String about;
  const ListHome({super.key, required this.name, required this.about});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.black12)),
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => EachTaskScreen(
                        title: name,
                        about: about,
                      ))));
        },
        child: SizedBox(
          width: double.infinity,
          height: 90,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Anotação:',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: name.isNotEmpty
                                ? Text(
                                    name,
                                    style: TextStyle(
                                        color: Colors.grey[900],
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                        overflow: TextOverflow.ellipsis),
                                  )
                                : Text(
                                    '(Tarefa Sem nome)',
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                        overflow: TextOverflow.ellipsis),
                                  )),
                      ],
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: about.isNotEmpty
                                ? Text(
                                    about,
                                    style: TextStyle(
                                      color: Colors.grey[900],
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                : Text(
                                    '(Tarefa sem descrição)',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ))
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
