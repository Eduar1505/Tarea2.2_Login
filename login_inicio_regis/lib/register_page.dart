import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _register() {
    if (_formKey.currentState!.validate()) {
      print('Nombre: ${_nameController.text}');
      print('Correo: ${_emailController.text}');
      print('Teléfono: ${_phoneController.text}');
      print('Contraseña: ${_passwordController.text}');
    }
  }

  String? _validatePassword(String? value) {
    if (value == null || value.length < 8) return 'La contraseña debe tener al menos 11 caracteres';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Este campo es obligatorio';
                  if (value.length < 3 || value.length > 10) return 'Debe tener entre 3 y 10 caracteres';
                  return null;
                },
              ),
              SizedBox(height: 16),

              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Correo'),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Este campo es obligatorio';
                  if (!RegExp('unah.hn').hasMatch(value)) {
                    return 'Correo no válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: 'Teléfono'),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Este campo es obligatorio';
                  if (!RegExp(r'^[39]\d{7}$').hasMatch(value)) return 'Teléfono no válido';
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Contraseña'),
                validator: _validatePassword,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Confirmar Contraseña'),
                validator: (value) {
                  if (value != _passwordController.text) return 'Las contraseñas no coinciden';
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _register,
                child: Text('Regístrate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
