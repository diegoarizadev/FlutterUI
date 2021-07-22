import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UIFLutter'),
      ),
      drawer: _MainMenu(), //Menu Hamburguesa.!
      body: _ListOpcions(),
    );
  }
}

class _ListOpcions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics:
          BouncingScrollPhysics(), //Para que en android y Ios se vean iguales.
      separatorBuilder: (context, i) => Divider(
        color: Colors.red,
      ),
      itemCount: 10,
      itemBuilder: (context, i) => const ListTile(
        leading: FaIcon(
          FontAwesomeIcons.slideshare,
          color: Colors.redAccent,
        ),
        title: Text('Hola Mundo'),
        trailing: Icon(
          Icons.chevron_right,
          color: Colors.redAccent,
        ),
        onTap: null,
      ),
    );
  }
}

//Clase para el menu hamburguesa.
class _MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: 200.0,
              child: CircleAvatar(
                backgroundColor: Colors.redAccent,
                child: Text(
                  'DA',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
            ),
            Expanded(
              child: _ListOpcions(),
            ),
          ],
        ),
      ),
    );
  }
}
