import 'package:flutter/material.dart';
import '../../assets/theme.dart';

const isLogged = false;

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
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title, style: TextStyle(color: secondaryColorFont), ),
      centerTitle: true,
      actions: getActions(isLogged),
      backgroundColor: firstDarkColorUser,
      leading: IconButton(
        icon: Icon(Icons.menu, color: secondaryColorFont),
        onPressed: (){
          Scaffold.of(context).openDrawer();
        },
      ),
    );
  }
}

List<Widget> getActions(bool isLogged){
  if(isLogged){
    return[
        IconButton(icon: Icon(Icons.settings), color: secondaryColorFont, onPressed: () => {print('configuraciones')}),
        IconButton(icon: Icon(Icons.person), onPressed: () => {print('perfil')}),
        IconButton(icon: Icon(Icons.logout), onPressed: () => {print('cerrar sesion')})
    ];
  }else{
    return [
      IconButton(icon: Icon(Icons.login), color: secondaryColorFont, onPressed: () => {print('iniciar sesion')}),
    ];
  } 
}
