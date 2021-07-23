import 'package:custompainter/src/routes/routes.dart';
import 'package:custompainter/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
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
          const BouncingScrollPhysics(), //Para que en android y Ios se vean iguales.
      separatorBuilder: (context, i) => const Divider(
        color: Colors.red,
      ),
      itemCount: pageRouters.length,
      itemBuilder: (context, i) => ListTile(
          leading: FaIcon(
            pageRouters[i].icon,
            color: Colors.redAccent,
          ),
          title: Text(pageRouters[i].title),
          trailing: const Icon(
            Icons.chevron_right,
            color: Colors.redAccent,
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => pageRouters[i]
                        .page)); //Navegación a cada una de las paginas.
          }),
    );
  }
}

//Clase para el menu hamburguesa.
class _MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                width: double.infinity,
                height: 200.0,
                child: const CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  child: Text(
                    'DA',
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: _ListOpcions(),
            ),
            ListTile(
              leading: const Icon(
                Icons.light_mode_outlined,
                color: Colors.redAccent,
              ),
              title: const Text('Dark Mode'),
              trailing: Switch.adaptive(
                  value: appTheme.Darktheme,
                  activeColor: Colors.red,
                  onChanged: (value) => appTheme.Darktheme =
                      value), //Switch.adaptive Se mostrar el Switch de cada S.O.
            ),
            SafeArea(
              bottom: true,
              top: false,
              right: false,
              left: false,
              child: ListTile(
                leading: const Icon(
                  Icons.add_to_home_screen,
                  color: Colors.redAccent,
                ),
                title: const Text('Custom Theme'),
                trailing: Switch.adaptive(
                    value: appTheme.Customtheme,
                    activeColor: Colors.red,
                    onChanged: (value) => appTheme.Customtheme =
                        value), //Switch.adaptive Se mostrar el Switch de cada S.O.
              ),
            ),
          ],
        ),
      ),
    );
  }
}
