import 'package:flutter/material.dart';
import 'package:widgethub/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        // backgroundColor: Colors.purple[50],
        // centerTitle: true,
      ),
      body: Center(child: Text('Welcome to the Home Page!')),
      drawer: MyDrawer(),
    );
  }
}
