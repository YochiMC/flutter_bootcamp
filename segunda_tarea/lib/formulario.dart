import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FormularioCuenta extends StatefulWidget {
  const FormularioCuenta({Key? key}) : super(key: key);

  @override
  State<FormularioCuenta> createState() => _FormularioCuentaState();
}

class _FormularioCuentaState extends State<FormularioCuenta> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoPaternoController =
      TextEditingController();
  final TextEditingController _apellidoMaternoController =
      TextEditingController();
  final TextEditingController _correoElectronico = TextEditingController();
  final TextEditingController _contrasenia = TextEditingController();

  void _enviarFormulario() async {

  }

  @override
  Widget build(BuildContext context) {
    return 
Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.greenAccent,
            title: Text('Crear Cuenta'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formkey,
              child: ListView(
                children: [
                  TextFormField(
                    controller: _nombreController,
                    decoration: const InputDecoration(labelText: 'Nombre_: '),
                    validator: (value) =>
                    value!.isEmpty ? 'Ingrese su nombre' : null,
                  )
                ],
              ),
              ),
            ),
        );
  }
}
