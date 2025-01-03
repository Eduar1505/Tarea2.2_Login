import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String email;

  const HomeScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pantalla de Inicio')),
      body: Center(
        child: Text('Bienvenido, $email', style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
