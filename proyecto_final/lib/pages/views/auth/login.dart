import 'package:flutter/material.dart';
import '../../../services/auth_service.dart';
import '../../../assets/theme.dart';
import '../admin/crud_aranias.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _authService = AuthService();
  bool _isLoading = false;

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: alternativeColorOther),
    );
  }

  Future<void> _handleSignIn() async {
    setState(() {
      _isLoading = true;
    });

    final user = await _authService.signInWithGoogle();

    setState(() {
      _isLoading = false;
    });

    if (user != null) {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Dashboard()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Inicio de sesión (solo para administradores)', style: titulo),
            FilledButton(
              onPressed: () async {
                final user = await AuthService().signInWithGoogle();
                if (user != null) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Dashboard()),
                  );
                }
              },
              child: Text('Iniciar sesión con Google', style: normal),
            ),
          ],
        ),
      ),
    );
  }
}
