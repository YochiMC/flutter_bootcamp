import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FormularioCuenta extends StatefulWidget {
  const FormularioCuenta({Key? key}) : super(key: key);
  @override
  State<FormularioCuenta> createState() => _FormularioCuentaState();
}

class _FormularioCuentaState extends State<FormularioCuenta> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _edadController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _correoElectronicoController =
      TextEditingController();
  final TextEditingController _contraseniaController = TextEditingController();

  var _isOscured = true;

  void _enviarFormulario() async {
    if (_formKey.currentState!.validate()) {
      await FirebaseFirestore.instance.collection('Cuentas').add({
        'nombre_usuario': _nombreController.text,
        'edad_usuario': int.tryParse(_edadController.text),
        'telefono_usuario': _telefonoController.text,
        'correo_usuario': _correoElectronicoController.text,
        'contrasenia': _contraseniaController.text,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Formulario enviado exitosamente')),
      );

      _formKey.currentState!.reset();
      _nombreController.clear();
      _edadController.clear();
      _telefonoController.clear();
      _correoElectronicoController.clear();
      _contraseniaController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text('Crear Cuenta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre: ',
                  hintText: 'nombre (s)',
                ),
                validator:
                    (value) => value!.isEmpty ? 'Ingrese su nombre' : null,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _edadController,
                decoration: const InputDecoration(
                  labelText: 'Edad: ',
                  hintText: 'de 18 a 60',
                ),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'Ingrese su edad';
                  }
                  final int? edad = int.tryParse(value);
                  if(edad == null){
                    return 'La edad debe de ser un número';
                  }
                  if(edad < 18 || edad >60){
                    return 'La edad debe de estar entre 18 y 60';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _telefonoController,
                decoration: const InputDecoration(
                  labelText: 'Telefono Celular: ',
                  hintText: 'xxxxxxxxxxx',
                ),
                validator:
                    (value) =>
                        value!.isEmpty ? 'Ingrese su número de telefono' : null,
              ),
              TextFormField(
                controller: _correoElectronicoController,
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico: ',
                  hintText: 'example@domain.com',
                ),
                validator:
                    (value) =>
                        value!.isEmpty ? 'Ingrese su correo electrónico' : null,
              ),
              TextFormField(
                obscureText: _isOscured,
                controller: _contraseniaController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    padding: const EdgeInsetsDirectional.only(end: 12.0),
                    icon:
                        _isOscured
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isOscured = !_isOscured;
                      });
                    },
                  ),
                  labelText: 'Contraseña: ',
                  hintText: 'password',
                ),
                validator:
                    (value) => value!.isEmpty ? 'Ingrese su contraseña' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _enviarFormulario,
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
