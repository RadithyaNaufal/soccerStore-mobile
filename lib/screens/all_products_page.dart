import 'package:flutter/material.dart';
import 'package:soccer_store/widgets/left_drawer.dart';

class AllProductsPage extends StatelessWidget {
  const AllProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All Products',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: const Center(
        child: Text(
          'All of our Products.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}