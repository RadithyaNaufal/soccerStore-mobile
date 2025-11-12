import 'package:flutter/material.dart';
import 'package:soccer_store/screens/product_form.dart';
import 'package:soccer_store/screens/my_products_page.dart';
import 'package:soccer_store/screens/all_products_page.dart';

class ItemHomepage {
    final String name;
    final IconData icon;
    final Color color;

    ItemHomepage(this.name, this.icon, this.color);
  }

class ItemCard extends StatelessWidget {
  final ItemHomepage item; 
  
  const ItemCard(this.item, {super.key}); 

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("You have pressed the ${item.name} button!"))
            );
          
          if (item.name == "Create Products") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProductFormPage())
            );
          } else if (item.name == "My Products") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyProductsPage())
            );
          } else if (item.name == "All Products") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AllProductsPage())
            );
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