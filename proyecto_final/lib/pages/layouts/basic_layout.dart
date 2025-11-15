import 'package:flutter/material.dart';
import '../components/app_barcito.dart';
import '../../assets/theme.dart';

const String userType = 'admin';
final Map<String, Color> theme= getTheme(userType);

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
      appBar: AppBarcito(title: widget.title, userType: getUserType(), color: theme['alternative']),
      body:
          widget.child ??
          Center(child: Text('Hubo un error, lamento los incovenientes :c')),
          backgroundColor: theme['primary'],
    );
  }
}

String getUserType() {
  return userType;
}
