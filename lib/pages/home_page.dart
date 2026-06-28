import 'package:flutter/material.dart';
import 'package:widgethub/modules/catelog.dart';
import 'package:widgethub/widgets/drawer.dart';
import 'package:widgethub/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),

      appBar: AppBar(
        title: const Text("Widget Hub"),
        // backgroundColor: Colors.purple[50],
        // centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: CatalogModel.products.length,
        itemBuilder: (context, index) {
          return ItemWidget(item: CatalogModel.products[index]);
        },
      ),
    );
  }
}
