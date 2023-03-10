import 'package:flutter/material.dart';
import 'package:todolist/widgets/tasks/eachtask_home.dart';

import '../../data/work/task_work_db.dart';
import '../../widgets/tasks/eachtask_work.dart';

class FormScreenWork extends StatelessWidget {
  FormScreenWork({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController clientController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Adicione uma anotação'),
        ),
        backgroundColor: Colors.blue[50],
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  controller: nameController,
                  decoration: InputDecoration(
                    fillColor: Colors.blue[100],
                    filled: true,
                    hintText: 'Título da anotação',
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 0, color: Colors.white),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        controller: clientController,
                        decoration: InputDecoration(
                          fillColor: Colors.blue[100],
                          filled: true,
                          hintText: 'cliente',
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 0, color: Colors.white),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: dateController,
                        onTap: () async {
                          DateTime? date = DateTime(1900);
                          FocusScope.of(context).requestFocus(FocusNode());
                          date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100));
                          dateController.text =
                              '${date!.day.toString()}/${date.month.toString()}/${date.year.toString()}';
                        },
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          fillColor: Colors.blue[100],
                          filled: true,
                          hintText: 'prazo de entrega',
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 0, color: Colors.white),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: aboutController,
                  maxLines: null,
                  minLines: 12,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    fillColor: Colors.blue[100],
                    filled: true,
                    hintText: 'Sobre a anotação',
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 0, color: Colors.white),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      TaskWorkDao().save(EachTaskWork(
                        name: nameController.text,
                        about: aboutController.text,
                        client: clientController.text,
                        date: dateController.text,
                      ));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Anotação salva com sucesso!')));
                      Navigator.pop(context);
                    },
                    child: const Text('Adicionar'),
                  ))
            ],
          ),
        ));
  }
}
