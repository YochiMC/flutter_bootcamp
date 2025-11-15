import 'package:flutter/material.dart';

class AppBarcito extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final String userType;
  final Color? color;

  const AppBarcito({super.key, required this.title, required this.userType, required this.color});

  @override
  State<AppBarcito> createState() => _AppBarcitoState();

  @override
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight + 45);
  }
}

class _AppBarcitoState extends State<AppBarcito> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      actions: setActions(widget.userType),
      backgroundColor: widget.color,
    );
  }
}

List<Widget> setActions(String userType) {
  switch (userType) {
    case 'admin':
      return [
        IconButton(icon: Icon(Icons.settings), onPressed: () => {}),
        IconButton(icon: Icon(Icons.person), onPressed: () => {}),
        IconButton(icon: Icon(Icons.logout), onPressed: () => {}),
      ];
    case 'user':
      return [
        IconButton(icon: Icon(Icons.settings), onPressed: () => {}),
        IconButton(icon: Icon(Icons.person), onPressed: () => {}),
        IconButton(icon: Icon(Icons.logout), onPressed: () => {}),
      ];
    case 'guest':
      return [
        IconButton(icon: Icon(Icons.settings), onPressed: () => {}),
        IconButton(icon: Icon(Icons.person), onPressed: () => {}),
        IconButton(icon: Icon(Icons.login), onPressed: () => {}),
      ];
    default:
      return [];
  }
}
