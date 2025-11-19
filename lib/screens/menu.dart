import 'package:flutter/material.dart';
import 'package:soccer_store/widgets/left_drawer.dart';
import 'package:soccer_store/screens/my_products_page.dart';
import 'package:soccer_store/screens/all_products_page.dart';
import 'package:soccer_store/screens/product_form.dart';
import 'package:soccer_store/screens/login_page.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String nama = "Radithya Naufal Mulia";
  final String npm = "2406365225";
  final String kelas = "KKI";

  final List<ItemHomepage> items = [
    ItemHomepage("All Products", Icons.storefront, Colors.blue),
    ItemHomepage("My Products", Icons.inventory_2, Colors.green),
    ItemHomepage("Create Product", Icons.add, Colors.red),
    ItemHomepage("Logout", Icons.logout, Colors.redAccent),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Soccer Store',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Welcome to Soccer Store',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ItemHomepage item) {
                  return MenuCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  ItemHomepage(this.name, this.icon, this.color);
}

class MenuCard extends StatelessWidget {
  final ItemHomepage item;

  const MenuCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () async {
          if (item.name == "Create Product") {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductFormPage()));
          } else if (item.name == "All Products") {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AllProductsPage()));
          } else if (item.name == "My Products") {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MyProductsPage()));
          } else if (item.name == "Logout") {
            final response = await request.logout(
                "http://127.0.0.1:8000/logout-ajax/");
            String message = response["message"];
            if (context.mounted) {
              if (response['status'] == 'success') {
                String uname = response["username"] ?? "User";
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("$message Goodbye, $uname."),
                ));
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(message),
                ));
              }
            }
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}