import 'package:flutter/material.dart';
import 'package:todolist/widgets/boxHowAdd/box_how_add.dart';
import 'package:todolist/widgets/loading/loading.dart';
import 'package:todolist/widgets/tasks/eachtask_home.dart';
import '../../data/work/task_work_db.dart';
import '../../widgets/tasks/eachtask_work.dart';
import '../form/form_screen_work.dart';

class WorkScreen extends StatefulWidget {
  const WorkScreen({super.key});

  @override
  State<WorkScreen> createState() => _WorkScreenState();
}

class _WorkScreenState extends State<WorkScreen> {
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<EachTaskWork>>(
          future: TaskWorkDao().findAll(),
          builder: ((context, snapshot) {
            List<EachTaskWork>? item = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                const LoadingWidget();
                break;
              case ConnectionState.waiting:
                const LoadingWidget();
                break;
              case ConnectionState.active:
                const LoadingWidget();
                break;
              case ConnectionState.done:
                if (snapshot.hasData && item != null) {
                  if (item.isNotEmpty) {
                    return ListView.builder(
                        itemCount: item.length,
                        itemBuilder: (context, index) {
                          final EachTaskWork eachTask = item[index];
                          return eachTask;
                        });
                  }
                  return Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: Icon(
                          Icons.folder_off,
                          color: Colors.blue[200],
                          size: 128,
                        ),
                      ),
                      Row(
                        children: const [BoxHowAdd()],
                      )
                    ],
                  ));
                }
                return (const Center(
                  child: Text('Erro no banco de dados'),
                ));
            }
            return Container();
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FormScreenWork()))
              .then((value) {
            refresh();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
