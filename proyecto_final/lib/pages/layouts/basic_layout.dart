import 'package:flutter/material.dart';
import '../components/app_barcito.dart';
import '../components/nav_drawer.dart';
import '../../assets/theme.dart';

const String userType = 'admin';
class BasicLayout extends StatefulWidget {
  final String title;
  final Widget? child;

  const BasicLayout({super.key, required this.title, this.child});

  @override
  State<BasicLayout> createState() => _BasicLayoutState();
}

class _BasicLayoutState extends State<BasicLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarcito(title: widget.title,),
      drawer: MenuLateral(),
      body:
          widget.child ??
          Center(child: Text('Hubo un error, lamento los incovenientes :c')),
          backgroundColor: primaryColorUser,
    );
  }
}

String getUserType() {
  return userType;
} 
