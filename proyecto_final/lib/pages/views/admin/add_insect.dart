import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../layouts/basic_layout.dart';

class AddInsect extends StatefulWidget {
  const AddInsect({super.key});

  @override
  State<AddInsect> createState() => _AddInsectState();
}

class _AddInsectState extends State<AddInsect> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _urlImagenController = TextEditingController();
  bool _im = false;

  void _sendForm() async {
    if (_formKey.currentState!.validate()) {
      await FirebaseFirestore.instance.collection('aranias').add({
        'nombre': _nombreController.text,
        'descripcion': _descripcionController.text,
        'url_img': _urlImagenController.text,
        'im': _im,
      });
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Araña agregada correctamente')),
    );

    _formKey.currentState!.reset();
    _nombreController.clear();
    _descripcionController.clear();
    _urlImagenController.clear();
    setState(() {
      _im = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      title: 'Agregar araña',
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  controller: _nombreController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre de la araña: ',
                    hintText: 'araña xxxxxxx',
                  ),
                  validator: (value) {
                    return null;
                  },
                ),
                TextFormField(
                  controller: _descripcionController,
                  decoration: const InputDecoration(
                    labelText: 'Descripción de la araña: ',
                    hintText: 'Describe la araña...',
                  ),
                  validator: (value) {
                    return null;
                  },
                ),
                TextFormField(
                  controller: _urlImagenController,
                  decoration: const InputDecoration(
                    labelText: 'URL de la imagen: ',
                    hintText: 'https:imagen.com',
                  ),
                  validator: (value) {
                    return null;
                  },
                ),
                SwitchListTile(
                  title: Text('Importancia médica: '),
                  value: _im,
                  onChanged: (value) {
                    setState(() {
                      _im = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(onPressed: _sendForm, child: Text('Agregar')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
