import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../layouts/basic_layout.dart';

Future<DocumentSnapshot> fetchAraniaInfo(String id) async {
  final arania = FirebaseFirestore.instance.collection('aranias').doc(id);
  return await arania.get();
}

class UpdateInsect extends StatefulWidget {
  final idInsect;
  const UpdateInsect({super.key, required this.idInsect});

  @override
  State<UpdateInsect> createState() => _UpdateInsectState();
}

class _UpdateInsectState extends State<UpdateInsect> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _urlImagenController = TextEditingController();
  bool _im = false;
  bool _isDataInitialized = false;

  Future<void> _sendForm(String id) async {
    if (_formKey.currentState!.validate()) {
      await FirebaseFirestore.instance.collection('aranias').doc(id).update({
        'nombre': _nombreController.text,
        'descripcion': _descripcionController.text,
        'url_img': _urlImagenController.text,
        'im': _im,
      });
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Araña actualizada correctamente')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      title: 'Editar información',
      child: Scaffold(
        body: FutureBuilder<DocumentSnapshot>(
          future: fetchAraniaInfo(widget.idInsect),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error al cargar: ${snapshot.error}'),
                  );
                }
                if (snapshot.hasData && snapshot.data!.exists) {
                  final Map<String, dynamic> data =
                      snapshot.data!.data()! as Map<String, dynamic>;
                  if (!_isDataInitialized) {
                    _nombreController.text = data['nombre'] ?? '';
                    _descripcionController.text = data['descripcion'] ?? '';
                    _urlImagenController.text = data['url_img'] ?? '';
                    _im = data['im'];
                    _isDataInitialized = true;
                  }

                  return Padding(
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
                          ElevatedButton(
                            onPressed: () {
                              _sendForm(widget.idInsect);
                            },
                            child: Text('Actualizar'),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return Center(
                  child: Text('Hubo un error al tratar de buscar araña'),
                );
              },
        ),
      ),
    );
  }
}
