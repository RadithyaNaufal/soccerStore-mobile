import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:soccer_store/models/item_model.dart';
import 'package:soccer_store/widgets/left_drawer.dart';
import 'package:soccer_store/widgets/product_card.dart';

class MyProductsPage extends StatefulWidget {
  const MyProductsPage({super.key});

  @override
  State<MyProductsPage> createState() => _MyProductsPageState();
}

class _MyProductsPageState extends State<MyProductsPage> {
  Future<List<ItemModel>>? _future;

  Future<List<ItemModel>> fetchItems() async {
    final request = Provider.of<CookieRequest>(context, listen: false);
    final response = await request.get('http://127.0.0.1:8000/get-news-json/?filter=my');
    
    var data = response;
    
    List<ItemModel> listItems = [];
    for (var d in data) {
      if (d != null) {
        listItems.add(ItemModel.fromJson(d));
      }
    }
    return listItems;
  }

  @override
  Widget build(BuildContext context) {
    _future ??= fetchItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Products'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: _future,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
             return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "No items found for this user.",
                      style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) {
                  final item = snapshot.data![index];
                  return ProductCard(item: item);
                },
              );
            }
          }
        },
      ),
    );
  }
}