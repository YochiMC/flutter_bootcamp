import 'package:flutter/material.dart';
import '../../layouts/basic_layout.dart';
import '../../../assets/theme.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      title: 'Acerca de nosotros',
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Text('Contactanos', style: titulo),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                width: 1000,
                height: 100,
                child: Text(
                  'Micrositio hecho con el mero fin de informar a las personas, además de ser parte de mi proyecto final para un Bootcamp de Flutter, ' +
                  'sugerencias en el siguiente correo: josephmartinezcortes5@gmail.com y mi perfil de GitHub por si quieres revisar mis repos @YochiMC.',
                  textAlign: TextAlign.center,
                  style: normal,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                width: 1000,
                height: 100,
                child: Text(
                  'Espero que les sea de mucha ayuda y que pudan aportar a la comunidad para evitar accidentes y mantener un ecosistema en buenas condciones. ',
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
