import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../model/domain/item.dart';

class ItemDetailsPage extends StatefulWidget {
  @override
  _ItemDetailsPageState createState() => _ItemDetailsPageState();
}

class ProductDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Produto'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              product['nome'], // substitua 'nome' pelo nome do campo que contém o nome do produto
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              product['descricao'], // substitua 'descricao' pelo nome do campo que contém a descrição do produto
              style: TextStyle(fontSize: 16),
            ),
            // Adicione outros widgets para exibir mais detalhes do produto
          ],
        ),
      ),
    );
  }
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  final Map<String, dynamic> item;
  _ItemDetailsPageState({required this.item});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Item'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item['name'],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(item['old_price'],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 16),
                                  overflow: TextOverflow.ellipsis),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                _launchURL(itemLink);
              },
              child: Text('Comprar'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível abrir o link: $url';
    }
  }
}

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => ItemDetailsPage(
        itemName: args.data['name'],
        itemPrice: args.data['price'],
        itemLink: args.data['link'],
      ),
    ),
  ];
}
