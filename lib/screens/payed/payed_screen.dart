import 'package:flutter/material.dart';
import 'package:todolist/data/payed/task_payed_db.dart';
import 'package:todolist/widgets/tasks/eachtask_payed.dart';
import '../../widgets/loading/loading.dart';

class PayedScreen extends StatefulWidget {
  const PayedScreen({super.key});

  @override
  State<PayedScreen> createState() => _PayedScreenState();
}

class _PayedScreenState extends State<PayedScreen> {
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<EachTaskPayed>>(
          future: TaskPayedDao().findAll(),
          builder: ((context, snapshot) {
            List<EachTaskPayed>? item = snapshot.data;
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
                          final EachTaskPayed eachTask = item[index];
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
                    ],
                  ));
                }
                return (const Center(
                  child: Text('Erro no banco de dados'),
                ));
            }
            return Container();
          })),
    );
  }
}
