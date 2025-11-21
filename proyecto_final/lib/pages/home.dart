import 'package:flutter/material.dart';
import 'layouts/basic_layout.dart';
import '../assets/theme.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      title: 'Home',
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Text('Bienvenido', style: titulo),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                width: 1000,
                height: 100,
                child: Text(
                  'De seguro te estarás preguntando porque existe este pequeño micrositio, ' +
                      'el origen de esta página se debe principalmente a la desinformación que hay ' +
                      'acerca de las arañas y otros insectos de los cuales hay que tener ciertas ' +
                      'precauciones.',
                  textAlign: TextAlign.center,
                  style: normal,
                ),
              ),
              Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Spiders_Diversity.jpg/960px-Spiders_Diversity.jpg', width: 250, height: 250),
              Container(
                padding: EdgeInsets.only(top: 20),
                width: 1000,
                height: 100,
                child: Text(
                  'Es importante recordar que existen una gran variedad de arañas allá afuera que pueden son parte del ecosistema. ' + 
                  'Hay otras que no y es por eso que este sitio esta para poder añadir un montón de información de arañas de muchos lugares e identificarlas. ',
                  textAlign: TextAlign.center,
                  style: normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
