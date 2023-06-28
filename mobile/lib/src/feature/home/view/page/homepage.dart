import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Table(
          border:
              TableBorder.all(color: Color.fromARGB(255, 0, 0, 0), width: 1.5),
          children: const [
            TableRow(children: [
              Text(
                "1",
                style: TextStyle(fontSize: 15.0),
              ),
              Text(
                "Mohit",
                style: TextStyle(fontSize: 15.0),
              ),
              Text(
                "Ankit",
                style: TextStyle(fontSize: 15.0),
              ),
            ]),
            TableRow(children: [
              Text(
                "2",
                style: TextStyle(fontSize: 15.0),
              ),
              Text(
                "Ankit",
                style: TextStyle(fontSize: 15.0),
              ),
              Text(
                "Mohit",
                style: TextStyle(fontSize: 15.0),
              ),
            ]),
            TableRow(children: [
              Text(
                "3",
                style: TextStyle(fontSize: 15.0),
              ),
              Text(
                "Rakhi",
                style: TextStyle(fontSize: 15.0),
              ),
              Text(
                "Yash",
                style: TextStyle(fontSize: 15.0),
              ),
            ]),
            TableRow(children: [
              Text(
                "4",
                style: TextStyle(fontSize: 15.0),
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
