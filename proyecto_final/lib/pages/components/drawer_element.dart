import 'package:flutter/material.dart';

class DrawerElement extends StatelessWidget {
  final Icon icon;
  final String title;
  final Widget page;

  const DrawerElement({
    super.key,
    required this.icon,
    required this.title,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(title),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}
