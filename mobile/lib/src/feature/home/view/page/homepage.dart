import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import '../../../../../mongodb.dart';

//List<Product> products = collection('find');
connect() async {
  var db = await Db.create(
      'mongodb+srv://gabrielhjalberto:gabriel123@cluster0.t8961c5.mongodb.net/?Market_Scraper_Mobile?retryWrites=true&w=majority');
  await db.open();
  var status = db.serverStatus();
  print(status);
  print("Conectou");
  final collection = db.collection('produtos');
}

class Product {
  final int id;
  final String name;
  final String image;
  final double price;
  int quantity;

  Product(
      {required this.id,
      required this.name,
      required this.image,
      required this.price,
      this.quantity = 0});
}

List<Product> products = [
  Product(
      id: 1,
      name: 'Champion',
      image:
          'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
      price: 55.5),
  Product(
      id: 2,
      name: 'Stark',
      image:
          'https://images.unsplash.com/photo-1549298916-b41d501d3772?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1624&q=80',
      price: 65.5),
];

class HomePage extends StatelessWidget {
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PromoHunter"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          products.length,
          (index) {
            return Container(
              alignment: Alignment.center,
              child: SelectCard(product: products[index]),
            );
          },
        ),
      ),
    );
  }
}

class SelectCard extends StatelessWidget {
  const SelectCard({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.orange,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.network(
                product.image,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              Text(
                product.name,
              ),
              Text(
                '\$${product.price}',
              ),
            ],
          ),
        ));
  }
}
