import 'package:flutter/material.dart';
import '../../layouts/basic_layout.dart';
import '../../components/insect_card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      title: 'Arañas',
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  children: [
                    Row(children: [Text('Aquí van los filtros')]),
                    SearchBar(),
                  ],
                ),
                Row(
                  children: [
                    InsectCard(
                      imageUrl:
                          'https://www.gob.mx/cms/uploads/article/main_image/15585/ara_a-violinista-1-especieinof.jpg',
                      spiderName: 'Araña violinista',
                      spiderDescription:
                          'La araña violinista es una especie nocturna que se adapta a cualquier ecosistema.',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
