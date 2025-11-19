import 'package:flutter/material.dart';
import 'package:soccer_store/models/item_model.dart';

class ItemDetailPage extends StatelessWidget {
  final ItemModel item;

  const ItemDetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: item.thumbnail.isNotEmpty 
                    ? Image.network(item.thumbnail, fit: BoxFit.cover, errorBuilder: (c, o, s) => const Icon(Icons.image_not_supported, size: 50))
                    : const Icon(Icons.image, size: 50, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 20),
            
            Text(
              item.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Text(
              'Price: Rp. ${item.price.toString()}',
              style: const TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),

            const Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(item.description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Category: ${item.category}', style: const TextStyle(fontSize: 14, color: Colors.blueGrey)),
                Text('Views: ${item.newsViews}', style: const TextStyle(fontSize: 14, color: Colors.blueGrey)),
              ],
            ),
            const SizedBox(height: 10),
            Text('Posted: ${item.createdAt}', style: const TextStyle(fontSize: 14, color: Colors.blueGrey)),
            Text('Owner: ${item.userUsername}', style: const TextStyle(fontSize: 14, color: Colors.blueGrey)),
            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); 
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text('Back to Item List'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}