import 'package:custompainter/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PinterestGrid(),
        _PinterestMenuCenter(),
      ]),
    );
  }
}

class _PinterestMenuCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widhScreen =
        MediaQuery.of(context).size.width; //Ancho exacto de la pantalla
    return Positioned(
      bottom: 30,
      child: Container(
        //color: Colors.blue,
        width: widhScreen,
        child: Align(
          child: PinteresMenu(),
        ),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);

  ScrollController scrollController = ScrollController();
  double scrollOld = 0; //Posicion inicial de la pantalla.

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      controller: scrollController,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }

  @override
  void initState() {
    scrollController.addListener(() {
      print('Listener Scroll : ${scrollController.offset}');
      if (scrollController.offset > scrollOld) {
        print('Ocultar menu');
      } else {
        print('Mostrar menu');
      }
      scrollOld = scrollController.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Colors.orange),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}
