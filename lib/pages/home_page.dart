import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgethub/modules/catelog.dart';
import 'package:widgethub/pages/home_details_page.dart';
import 'package:widgethub/utils/routes.dart';
import 'package:widgethub/utils/theme.dart';
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

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, MYRoutes.cardRoute);
        },
        backgroundColor: MyTheme.lightTheme.primaryColor,
        shape: const CircleBorder(),
        child: const Icon(Icons.shopping_cart, color: Colors.white),
      ),
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
          : LayoutBuilder(
              builder: (context, constraints) {
                final crossAxisCount = constraints.maxWidth > 700 ? 4 : 2;

                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.78,
                  ),
                  itemCount: CatalogModel.products.length,
                  itemBuilder: (context, index) {
                    final item = CatalogModel.products[index];
                    return InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                HomeDetailsPage(catalog: item),
                          ),
                        );
                      },
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: GridTile(
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "\$${item.price.toStringAsFixed(2)}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 4),
                                GestureDetector(
                                  onTap: () {
                                    // Show snackbar when Add to Cart is clicked
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          '${item.name} added to cart!',
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        backgroundColor: Colors.purple,
                                        duration: const Duration(seconds: 2),
                                        behavior: SnackBarBehavior.floating,
                                      ),
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.purple,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Text(
                                      "Add to Cart",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          child: Hero(
                            tag: item.id.toString(),
                            child: Image.network(
                              item.image,
                              fit: BoxFit.cover,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;

                                    return Container(
                                      color: Colors.grey.shade200,
                                      child: const Center(
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ),
                                      ),
                                    );
                                  },
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey.shade200,
                                  child: const Icon(
                                    Icons.image_not_supported,
                                    color: Colors.grey,
                                    size: 42,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
