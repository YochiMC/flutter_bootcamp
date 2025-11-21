import 'package:flutter/material.dart';
import '../../layouts/basic_layout.dart';
import '../../components/insect_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Aranias extends StatefulWidget {
  const Aranias({super.key});

  @override
  State<Aranias> createState() => _AraniasState();
}

class _AraniasState extends State<Aranias> {
  final Stream<QuerySnapshot> araniasStream = FirebaseFirestore.instance
      .collection('aranias')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      title: 'Arañas',
      child: StreamBuilder<QuerySnapshot>(
        stream: araniasStream,
        builder: (BuildContext, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.hasData) {
            final List<DocumentSnapshot> aranias = snapshot.data!.docs;
            return GridView.builder(
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemCount: aranias.length,
              itemBuilder: (context, index) {
                final arania = aranias[index];
                return InsectCard(
                  id: arania.id,
                  imageUrl: arania['url_img'].toString(),
                  spiderName: arania['nombre'].toString(),
                  spiderDescription: arania['descripcion'].toString(),
                );
              },
            );
          }
          return Center(child: Text('No hay aranias registradas'));
        },
      ),
    );
  }
}
