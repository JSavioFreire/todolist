import 'package:flutter/material.dart';
import 'package:todolist/data/home/task_home_db.dart';
import 'package:todolist/widgets/boxHowAdd/box_how_add.dart';
import 'package:todolist/widgets/loading/loading.dart';
import 'package:todolist/widgets/tasks/eachtask_home.dart';
import '../../form/form_screen_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<EachTaskHome>>(
          future: TaskHomeDao().findAll(),
          builder: ((context, snapshot) {
            List<EachTaskHome>? item = snapshot.data;
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
                          final EachTaskHome eachTask = item[index];
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
                  MaterialPageRoute(builder: (context) => FormScreenHome()))
              .then((value) {
            refresh();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
