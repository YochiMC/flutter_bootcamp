import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../views/auth/login.dart';
import '../../assets/theme.dart';
import '../../services/auth_service.dart';
import '../home.dart';

class AppBarcito extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  const AppBarcito({super.key, required this.title});

  @override
  State<AppBarcito> createState() => _AppBarcitoState();

  @override
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight + 0);
  }
}

class _AppBarcitoState extends State<AppBarcito> {
  @override
  final user = FirebaseAuth.instance.currentUser;
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title, style: TextStyle(color: secondaryColorFont)),
      centerTitle: true,
      actions: getActions(user, context),
      backgroundColor: firstDarkColorUser,
      leading: IconButton(
        icon: Icon(Icons.menu, color: secondaryColorFont),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
    );
  }
}

List<Widget> getActions(User? user, BuildContext context) {
  if (user != null) {
    return [
      IconButton(
        icon: Icon(Icons.settings),
        color: secondaryColorFont,
        onPressed: () => {print('configuraciones')},
      ),
      IconButton(
        icon: Icon(Icons.person),
        color: secondaryColorFont,
        onPressed: () => {print('perfil')},
      ),
      IconButton(
        icon: Icon(Icons.logout),
        color: secondaryColorFont,
        onPressed: () async {
          print('entra');
          AuthService().signOut();
          Navigator.of(
            context,
          ).pushReplacement(MaterialPageRoute(builder: (context) => Home()));
        },
      ),
    ];
  } else {
    return [
      IconButton(
        icon: Icon(Icons.login),
        color: secondaryColorFont,
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          ),
        },
      ),
    ];
  }
}
