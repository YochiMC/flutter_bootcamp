import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final bool im;
  final String imageUrl;
  final String spiderName;
  final String spiderDescription;

  const InsectCard({
    super.key,
    required this.id,
    required this.im,
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
          icon: Icon(Icons.edit, color: secondaryColorFont),
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
          icon: Icon(Icons.delete, color: secondaryColorFont),
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
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: firstDarkColorOther,
        boxShadow: [
          BoxShadow(
            color: widget.im == true
            ? alertColor
            : adversimentColor,
            spreadRadius: 5,
            blurRadius: 5,
            offset: Offset(0, 3)
          )
        ],
        border: Border.all(color: firstDarkColorUser, width: 5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Expanded(child: Image.network(widget.imageUrl, width: 250, height: 250,)),
          SizedBox(height: 10),
          Text(widget.spiderName, style: titulo2Alt),
          SizedBox(height: 10),
          Text(
            widget.im == true
                ? 'Es de importancia médica'
                : 'No es de importancia médica',
            style: normalAlt,
          ),
          SizedBox(height: 10),
          Text(
            widget.spiderDescription,
            style: normalAlt,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Center(child: Row(spacing: 20, children: _getAdminButton())),
        ],
      ),
    );
  }
}
