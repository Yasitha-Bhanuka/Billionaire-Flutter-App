import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void afunction() {
    print("Button is passed!");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Billionaire App!',
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          body: Container(
            color: Colors.blueGrey[900],
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  flex: 9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Bank Balance"),
                      SizedBox(height: 20),
                      Text("0"),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[800],
                        minimumSize: const Size(double.infinity, 0),
                      ),
                      onPressed: afunction,
                      child: const Text("Add Money")),
                )
              ],
            ),
          )),
    );
  }
}
