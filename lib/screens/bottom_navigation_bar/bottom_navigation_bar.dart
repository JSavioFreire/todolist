import 'package:flutter/material.dart';
import 'package:todolist/screens/home/home_screen.dart';
import 'package:todolist/screens/payments/pay_screen.dart';
import 'package:todolist/screens/work/work_screen.dart';

class BottomNavigationBarCustom extends StatefulWidget {
  const BottomNavigationBarCustom({super.key});

  @override
  State<BottomNavigationBarCustom> createState() =>
      _BottomNavigationBarCustom();
}

class _BottomNavigationBarCustom extends State<BottomNavigationBarCustom> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    WorkScreen(),
    PayScreen(),
    Text(
      'Index 3: Settings',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anotações'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: 'Pessoal',
            backgroundColor: Colors.blue[600],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.business),
            label: 'Trabalho',
            backgroundColor: Colors.blue[700],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.attach_money_sharp),
            label: 'Contas',
            backgroundColor: Colors.blue[800],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.dataset),
            label: 'Arquivadas',
            backgroundColor: Colors.blue[900],
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        onTap: _onItemTapped,
      ),
    );
  }
}
