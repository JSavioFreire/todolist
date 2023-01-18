import 'package:flutter/material.dart';
import 'package:todolist/data/home/task_home_db.dart';
import 'package:todolist/widgets/tasks/eachtask_home.dart';

class FormScreenHome extends StatelessWidget {
  FormScreenHome({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController aboutController = TextEditingController();

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
                      TaskHomeDao().save(EachTaskHome(
                          name: nameController.text,
                          about: aboutController.text));
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
