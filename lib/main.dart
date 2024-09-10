import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// State are the information that can be changed during the lifetime of the widget.
// If we want to change the state of the widget, we need to use StatefulWidget.

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double bankBalance = 0.0;

  void addMoney() {
    setState(() {
      bankBalance += 100.0;
    });
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
                Expanded(
                  flex: 9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Bank Balance'),
                      const SizedBox(height: 20),
                      Text(
                        '\$$bankBalance',
                      ),
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
                      onPressed: addMoney,
                      child: const Text('Add Money')),
                )
              ],
            ),
          )),
    );
  }
}
