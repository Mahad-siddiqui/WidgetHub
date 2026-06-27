import 'package:flutter/material.dart';
import 'package:widgethub/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(child: Text('Welcome to the Home Page!')),
      drawer: MyDrawer(),
    );
  }
}
