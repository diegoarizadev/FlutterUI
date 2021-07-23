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
    final appTheme =
        Provider.of<ThemeChanger>(context).CurrentTheme; //Identifica el tema.

    return ListView.separated(
      physics:
          const BouncingScrollPhysics(), //Para que en android y Ios se vean iguales.
      separatorBuilder: (context, i) => Divider(
        color: appTheme.secondaryHeaderColor, //Colors.red,
      ),
      itemCount: pageRouters.length,
      itemBuilder: (context, i) => ListTile(
          leading: FaIcon(
            pageRouters[i].icon,
            color: appTheme.colorScheme.secondary,
          ),
          title: Text(pageRouters[i].title),
          trailing: Icon(
            Icons.chevron_right,
            color: appTheme.colorScheme.secondary,
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
                child: CircleAvatar(
                  backgroundColor: appTheme.CurrentTheme.secondaryHeaderColor,
                  child: const Text(
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
              leading: Icon(
                Icons.light_mode_outlined,
                color: appTheme.CurrentTheme.secondaryHeaderColor,
              ),
              title: const Text('Dark Mode'),
              trailing: Switch.adaptive(
                  value: appTheme.Darktheme,
                  activeColor: appTheme.CurrentTheme.secondaryHeaderColor,
                  onChanged: (value) => appTheme.Darktheme =
                      value), //Switch.adaptive Se mostrar el Switch de cada S.O.
            ),
            SafeArea(
              bottom: true,
              top: false,
              right: false,
              left: false,
              child: ListTile(
                leading: Icon(
                  Icons.add_to_home_screen,
                  color: appTheme.CurrentTheme.secondaryHeaderColor,
                ),
                title: const Text('Custom Theme'),
                trailing: Switch.adaptive(
                    value: appTheme.Customtheme,
                    activeColor: appTheme.CurrentTheme.secondaryHeaderColor,
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
