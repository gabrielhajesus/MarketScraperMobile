import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
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
              ));
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
              Text(
                "Yash",
                style: TextStyle(fontSize: 15.0),
              ),
              Text(
                "Rakhi",
                style: TextStyle(fontSize: 15.0),
              ),
            ]),
            TableRow(children: [
              Text(
                "5",
                style: TextStyle(fontSize: 15.0),
              ),
              Text(
                "Pragati",
                style: TextStyle(fontSize: 15.0),
              ),
              Text(
                "Rakhi",
                style: TextStyle(fontSize: 15.0),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
