import 'package:flutter/material.dart';

class ListPay extends StatelessWidget {
  final String title;
  final String about;
  final String value;
  final String venc;

  const ListPay(
      {super.key,
      required this.title,
      required this.about,
      required this.value,
      required this.venc});

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
          height: 100,
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
                          'Título:',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
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
                                    '(Conta sem nome)',
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
                          'Valor',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                          ),
                        ),
                        Text(
                          value.isNotEmpty ? value : 'Indefinido',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[900],
                              fontSize: 20),
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
                            width: MediaQuery.of(context).size.width * 0.5,
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
                      width: MediaQuery.of(context).size.width * 0.40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Vencimento:',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            venc.isNotEmpty ? venc : 'Indefinido',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[900],
                            ),
                            overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}
