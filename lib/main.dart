import 'package:billionaireapp/add_money_button.dart';
import 'package:billionaireapp/balance_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  void addMoney() async {
    setState(() {
      bankBalance += 100.0;
    });

    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Save an double value to 'decimal' key.
    await prefs.setDouble('bankBalance', bankBalance);
  }

  void loadBalance() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      // Try reading data from the counter key. If it does not exist, return 0.
      bankBalance = prefs.getDouble('bankBalance') ?? 0.0;
    });
  }

  @override
  void initState() {
    loadBalance();
    super.initState();
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
                BalanceView(bankBalance: bankBalance),
                AddMoneyButton(addMoneyFunction: addMoney),
              ],
            ),
          )),
    );
  }
}
