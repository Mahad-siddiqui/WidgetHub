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
          // : ListView.builder(
          //     itemCount: CatalogModel.products.length,
          //     itemBuilder: (context, index) {
          //       return ItemWidget(item: CatalogModel.products[index]);
          //     },
          //   ),
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
              ),
              itemCount: CatalogModel.products.length,
              itemBuilder: (context, index) {
                final item = CatalogModel.products[index];
                return Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: GridTile(
                    child: Image.network(item.image, fit: BoxFit.cover),
                    header: Container(
                      color: const Color.fromARGB(136, 100, 65, 97),
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        item.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    footer: Container(
                      color: const Color.fromARGB(137, 48, 22, 58),
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        item.price.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
