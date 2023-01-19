import 'package:flutter/material.dart';

class ListWork extends StatelessWidget {
  final String title;
  final String about;
  final String client;
  final String date;
  const ListWork(
      {super.key,
      required this.title,
      required this.about,
      required this.client,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.black12)),
      child: TextButton(
        onPressed: () {},
        child: SizedBox(
          width: double.infinity,
          height: 90,
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
                        'Trabalho:',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.70,
                          child: title.isNotEmpty
                              ? Text(
                                  title,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Prazo',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        date.isNotEmpty ? date : 'Indefinido',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[900],
                        ),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Cliente:',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                          ),
                        ),
                        Text(
                          client.isNotEmpty ? client : 'Indefinido',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[900],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
