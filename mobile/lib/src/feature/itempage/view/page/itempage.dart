import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemDetailsPage extends StatefulWidget {
  final Map<String, dynamic> item;
  ItemDetailsPage({required this.item});
  @override
  _ItemDetailsPageState createState() => _ItemDetailsPageState(item: item);
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
            SizedBox(
                height: 100, width: 100, child: Image.network(item['imagem'])),
            Text(item['name'],
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                overflow: TextOverflow.ellipsis),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (item['desconto'] != 0) ...[
                  Text(
                    "${item['desconto']}%",
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.end,
                  )
                ],
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(item['old_price'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                        overflow: TextOverflow.ellipsis),
                    Text(item['menor_preco'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                _launchURL(item['link']);
              },
              child: Text('Comprar'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await launchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Não foi possível abrir o link: $url';
    }
  }
}
