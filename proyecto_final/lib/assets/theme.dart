import 'package:flutter/material.dart';

//Colores admin
const primaryColorAdmin = Color.fromRGBO(218, 253, 186, 1);
const secondaryColorAdmin = Color.fromRGBO(154, 235, 163, 1);
const alternativeColorAdmin = Color.fromRGBO(69, 196, 176, 1);
const firstDarkColorAdmin = Color.fromRGBO(19, 103, 138, 1);
const secondDarkColorAdmin = Color.fromRGBO(1,32,48, 1);

//Colores usuarios
const primaryColorUser = Color(0xFFFFFF);
const secondaryColorUser = Color(0xDEEFE7);
const alternativeColorUser = Color(0xB4BEC9);
const firstDarkColorUser = Color(0x002333);
const secondDarkColorUser = Color(0x159A9C);

//Colores para fuentes
const primaryColorFont = Colors.black;
const secondaryColorFont = Colors.white;

//Colores dinamicos (es una prueba XD)
Map<String, Color> getTheme(String userType) {
  switch (userType) {
    case 'admin':
      return {
        'primary': primaryColorAdmin,
        'secondary': secondaryColorAdmin,
        'alternative': alternativeColorAdmin,
        'firstDark': firstDarkColorAdmin,
        'secondDark': secondDarkColorAdmin,
      };
    case 'user':
      return {
        'primary': primaryColorUser,
        'secondary': secondaryColorUser,
        'alternative': alternativeColorUser,
        'firstDark': firstDarkColorUser,
        'secondDark': secondDarkColorUser,
      };
    default:
      return {};
  }
}
