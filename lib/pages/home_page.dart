import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgethub/modules/catelog.dart';
import 'package:widgethub/widgets/drawer.dart';
import 'package:widgethub/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final catalogData = await rootBundle.loadString(
      "assets/files/catalog.json",
    );
    final decodedData = jsonDecode(catalogData);
    final productsData = decodedData["products"] as List;

    CatalogModel.products = productsData
        .map((item) => Items.fromMap(item as Map<String, dynamic>))
        .toList();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(title: const Text("Widget Hub")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: CatalogModel.products.length,
              itemBuilder: (context, index) {
                return ItemWidget(item: CatalogModel.products[index]);
              },
            ),
    );
  }
}
