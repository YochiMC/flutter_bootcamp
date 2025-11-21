import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../services/auth_service.dart';
import '../views/admin/update_insect.dart';
import '../../assets/theme.dart';

Future<void> _deleteArania(String id, BuildContext context) async {
  await FirebaseFirestore.instance.collection('aranias').doc(id).delete();
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text('Araña eliminada')));
}

class InsectCard extends StatefulWidget {
  final String id;
  final String imageUrl;
  final String spiderName;
  final String spiderDescription;

  const InsectCard({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.spiderName,
    required this.spiderDescription,
  });
  @override
  State<InsectCard> createState() => _InsectCardState();
}

class _InsectCardState extends State<InsectCard> {
  final user = FirebaseAuth.instance.currentUser;
  List<Widget> _getAdminButton() {
    if (user != null) {
      return [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => UpdateInsect(idInsect: widget.id),
              ),
            );
          },
          icon: Icon(Icons.edit),
        ),
        IconButton(
          onPressed: () async {
            final bool? shouldDelete = await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Elimnar'),
                content: Text('¿Estas seguro de eliminar esto?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text('Eliminar'),
                  ),
                ],
              ),
            );
            if (shouldDelete == true) {
              _deleteArania(widget.id, context);
            }
          },
          icon: Icon(Icons.delete),
        ),
      ];
    } else {
      return[

      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: alternativeColorOther,
        border: Border.all(color: firstDarkColorUser),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(child: Image.network(widget.imageUrl, fit: BoxFit.cover)),
          SizedBox(height: 10),
          Text(widget.spiderName),
          SizedBox(height: 10),
          Text(widget.spiderDescription, textAlign: TextAlign.center),
          Row(spacing: 20, children: _getAdminButton()),
        ],
      ),
    );
  }
}
