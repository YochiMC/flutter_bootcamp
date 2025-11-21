import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../layouts/basic_layout.dart';
import '../../components/insect_card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final Stream<QuerySnapshot> araniasStream = FirebaseFirestore.instance
      .collection('aranias')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      title: 'Arañas (Admin)',
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
