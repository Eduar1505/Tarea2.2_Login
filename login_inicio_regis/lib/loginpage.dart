import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [

              SizedBox(height: 125,),

              Icon(Icons.person,
              size: 100,),

              SizedBox(height: 25,),

              const Text(
                'Bienvenido a Tarea Login',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16),
              ),
              SizedBox(height: 10,),
            ],
            ),
          ),
        ),
    );
  }
}