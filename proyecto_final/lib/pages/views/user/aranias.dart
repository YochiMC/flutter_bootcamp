import 'package:flutter/material.dart';
import '../../layouts/basic_layout.dart';
import '../../components/insect_card.dart';

class Aranias extends StatefulWidget {
  const Aranias({super.key});

  @override
  State<Aranias> createState() => _AraniasState();
}

class _AraniasState extends State<Aranias> {
  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      title: 'Arañas',
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsetsGeometry.all(25),
            child: Column(
              children: [
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
