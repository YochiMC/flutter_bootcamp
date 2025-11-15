import 'package:flutter/material.dart';

//Colores admin
const primaryColorAdmin = Color(0xDAFDBA);
const secondaryColorAdmin = Color(0x9AEBA3);
const alternativeColorAdmin = Color(0x45C4B0);
const firstDarkColorAdmin = Color(0x13678A);
const secondDarkColorAdmin = Color(0x012030);

//Colores usuarios
const primaryColorUser = Color(0xFFFFFF);
const secondaryColorUser = Color(0xDEEFE7);
const alternativeColorUser = Color(0xB4BEC9);
const firstDarkColorUser = Color(0x002333);
const secondDarkColorUser = Color(0x159A9C);

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
