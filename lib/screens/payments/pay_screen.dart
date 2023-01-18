import 'package:flutter/material.dart';
import 'package:todolist/data/pay/task_pay_db.dart';
import 'package:todolist/screens/form/form_screen_pay.dart';
import 'package:todolist/widgets/boxHowAdd/box_how_add.dart';
import 'package:todolist/widgets/tasks/eachtask_pay.dart';
import '../../widgets/loading/loading.dart';

class PayScreen extends StatefulWidget {
  const PayScreen({super.key});

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  void refresh() {
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<EachTaskPay>>(
          future: TaskPayDao().findAll(),
          builder: ((context, snapshot) {
            List<EachTaskPay>? item = snapshot.data;
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
                          final EachTaskPay eachTask = item[index];
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
                  MaterialPageRoute(builder: (context) => FormScreenPay()))
              .then((value) {
            refresh();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
