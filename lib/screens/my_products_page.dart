import 'package:flutter/material.dart';
import 'package:soccer_store/widgets/left_drawer.dart';

class MyProductsPage extends StatelessWidget {
  const MyProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Products',
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
          'Your Products.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}