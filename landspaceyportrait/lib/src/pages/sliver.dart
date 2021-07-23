import 'package:custompainter/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliverListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(
            bottom: 0,
            right: 0,
            child: _NewList(),
          ),
        ],
      ),
      //_ListTasks(), //_HeaderTittle(), //
    );
  }
}

class _ListTasks extends StatelessWidget {
  final items = [
    _ListItem(
      titulo: 'Orange',
      color: Color(0xffF08F66),
    ),
    _ListItem(
      titulo: 'Family',
      color: Color(0xffF2A38A),
    ),
    _ListItem(
      titulo: 'Subscriptions',
      color: Color(0xffF7CDD5),
    ),
    _ListItem(
      titulo: 'Books',
      color: Color(0xffFCEBAF),
    ),
    _ListItem(
      titulo: 'Orange',
      color: Color(0xffF08F66),
    ),
    _ListItem(
      titulo: 'Family',
      color: Color(0xffF2A38A),
    ),
    _ListItem(
      titulo: 'Subscriptions',
      color: Color(0xffF7CDD5),
    ),
    _ListItem(
      titulo: 'Books',
      color: Color(0xffFCEBAF),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) => items[index]);
  }
}

class _ListItem extends StatelessWidget {
  final String titulo;
  final Color color;

  const _ListItem({required this.titulo, required this.color});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(30),
      child: Text(
        titulo, //'Naranjas',
        style: TextStyle(
          color: (appTheme.Darktheme) ? Colors.grey : Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      height: 130,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color, //Colors.blueGrey,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}

class _HeaderTittle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            'Nuevo',
            style: TextStyle(
              color:
                  (appTheme.Darktheme) ? Colors.grey : const Color(0xff532128),
              fontSize: 50,
            ),
          ),
        ),
        Stack(
          children: [
            const SizedBox(
              width: 100,
            ),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 8,
                color: (appTheme.Darktheme)
                    ? Colors.grey
                    : const Color(0xfff7cdd5),
              ),
            ),
            Container(
              child: Text(
                'Lista',
                style: TextStyle(
                  color: (appTheme.Darktheme)
                      ? Colors.grey
                      : const Color(0xffd93a30),
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
    _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
    _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
    _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
    _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
    _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
    _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
    _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
    _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
    _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
    _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
    _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
            floating: true,
            delegate: _SliverCustomHeaderDelegate(
              minheight: 170,
              maxheight: 200,
              child: Container(
                alignment: Alignment.centerLeft,
                color: appTheme.CurrentTheme.scaffoldBackgroundColor,
                child: _HeaderTittle(),
              ),
            )),
        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            const SizedBox(
              //Espacio para el final del Scroll
              height: 100,
            )
          ]),
        ),
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minheight;
  final double maxheight;
  final Widget child;

  _SliverCustomHeaderDelegate(
      {required this.minheight, required this.maxheight, required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  //Tamaño maximo al cual se puede extender
  double get maxExtent => maxheight;

  @override
  //Tamaño minimo al cual se puede extender
  double get minExtent => minheight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    // redibujado
    return maxheight != oldDelegate.maxheight ||
        minheight != oldDelegate.minheight ||
        child != oldDelegate.child;
  }
}

class _NewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size =
        MediaQuery.of(context).size; //todas las dimensiones de las pantallas

    final appTheme = Provider.of<ThemeChanger>(context);

    return ButtonTheme(
      minWidth: size.width * 0.9,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: (appTheme.Darktheme)
              ? MaterialStateProperty.all<Color>(
                  appTheme.CurrentTheme.colorScheme.secondary)
              : MaterialStateProperty.all<Color>(const Color(0xffED6762)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
              ),
            ),
          ),
        ),
        onPressed: () {
          print('Crear nueva lista');
        },
        child: Container(
          height: size.height * 0.1,
          width: size.width * 0.8,
          child: Center(
            child: Text(
              'CREAR NUEVA LISTA',
              style: TextStyle(
                  color: appTheme.CurrentTheme.scaffoldBackgroundColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2),
            ),
          ),
        ),
      ),
    );
  }
}
