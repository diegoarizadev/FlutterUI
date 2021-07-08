import 'package:custompainter/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        body: Stack(children: [
          PinterestGrid(),
          _PinterestMenuCenter(),
        ]),
      ),
    );
  }
}

class _PinterestMenuCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widhScreen =
        MediaQuery.of(context).size.width; //Ancho exacto de la pantalla
    final hidden = Provider.of<_MenuModel>(context).hiddenMenu;
    return Positioned(
      bottom: 30,
      child: Container(
        //color: Colors.blue,
        width: widhScreen,
        child: Align(
          child: PinteresMenu(
            hidden: hidden,
          ),
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
      if (scrollController.offset > scrollOld &&
          scrollController.offset > 10.0) {
        print('Ocultar menu');
        Provider.of<_MenuModel>(context, listen: false).hiddenMenu = false;
      } else {
        print('Mostrar menu');
        Provider.of<_MenuModel>(context, listen: false).hiddenMenu = true;
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

class _MenuModel with ChangeNotifier {
  bool _hiddenMenu = true;

  bool get hiddenMenu => this._hiddenMenu;
  set hiddenMenu(bool value) {
    this._hiddenMenu = value;
    notifyListeners();
  }
}
