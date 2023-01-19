import 'package:flutter/material.dart';

class DrawerCuston extends StatelessWidget {
  const DrawerCuston({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue[50],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.infinity,
            height: 80,
            color: Colors.blue,
            child: const Center(
                child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            )),
          ),
        ],
      ),
    );
  }
}
