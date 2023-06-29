import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:predict/src/feature/itempage/view/page/itempage.dart';
import '../../../../commom/mongodb.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: MongoDataBase().fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Container(
              alignment: Alignment.center,
              child: const Text('Erro ao carregar os dados'));
        }

        final data = snapshot.data;

        if (data!.isEmpty) {
          return Container(
            alignment: Alignment.center,
            child: const Text(
              'Nenhum dado encontrado',
              textAlign: TextAlign.center,
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('PromoHunter'),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  print("pesquisando");
                },
              ),
            ],
          ),
          body: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: 30,
              itemBuilder: (context, index) {
                final item = data[index];
                return InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ItemDetailsPage(item: item),
                    //   ),
                    // );
                    Modular.to.pushNamed('/itempage', arguments: item);
                  },
                  child: GridTile(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.network(item['imagem'])),
                          Text(item['name'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                        ],
                      ),
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}
