import 'package:business/screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "hi",
      theme: ThemeData(
          backgroundColor: Colors.green,
          appBarTheme: AppBarTheme(backgroundColor: Colors.yellow.shade50)),
      home: screenpage(),
    );
  }
}
