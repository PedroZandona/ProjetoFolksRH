import 'package:flutter/material.dart';
import 'package:projeto_01/starter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      // Eu começo pela tela de carregamento para depois apresentar a welcome.
      home: const Starter(),
    );
  }
}
