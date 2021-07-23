import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestMenu extends StatelessWidget {
  final List items = List.empty();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PinterestButton {
  final Function onPressed;
  final IconData Icon;

  PinterestButton({required this.onPressed, required this.Icon});
}

class PinteresMenu extends StatelessWidget {
  final bool hidden;

  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;

  PinteresMenu(
      {this.hidden = true,
      this.backgroundColor = Colors.white,
      this.activeColor = Colors.red,
      this.inactiveColor = Colors.blueGrey,
      required this.items});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(), //Instancia del model para el provider
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: (this.hidden) ? 1 : 0,
        child: Builder(
          builder: (BuildContext context) {
            //final provider = Provider.of<_MenuModel>(context, listen: false);
            Provider.of<_MenuModel>(context, listen: false)
                .backgroundColorCustom = this.backgroundColor;
            Provider.of<_MenuModel>(context, listen: false).inactiveColor =
                this.inactiveColor;
            Provider.of<_MenuModel>(context, listen: false).activeColor =
                this.activeColor;

            return _PinterestMenuBackground(
              Child: _MenuItems(
                menuItems: items,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget Child;

  _PinterestMenuBackground({required this.Child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.Child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: Provider.of<_MenuModel>(context, listen: false)
              .backgroundColorCustom,
          borderRadius: BorderRadius.all(Radius.circular(90)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black38,
              spreadRadius: -5,
              blurRadius: 10,
            ),
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  _MenuItems({required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            menuItems.length,
            (index) => _PinteresMenuButton(
                  index: index,
                  item: menuItems[index],
                )));
  }
}

class _PinteresMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  const _PinteresMenuButton({required this.index, required this.item});

  @override
  Widget build(BuildContext context) {
    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSelected;

    final menuModel = Provider.of<_MenuModel>(context);

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSelected = index;
        item.onPressed();
      },
      behavior: HitTestBehavior
          .translucent, //Para lagunos dispositivos que no detectan la acción de los botones
      child: Container(
        child: Icon(
          item.Icon,
          size: (itemSeleccionado == index) ? 33 : 28,
          color: (itemSeleccionado == index)
              ? menuModel.activeColor
              : menuModel.inactiveColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  //Clase para el provider.
  int _itemSelected = 0;
  Color _backgroundColor = Colors.white;
  Color _activeColor = Colors.red;
  Color _inactiveColor = Colors.blueGrey;

  int get itemSelected => this._itemSelected;
  set itemSelected(int index) {
    this._itemSelected = index;
    notifyListeners();
  }

  Color get backgroundColorCustom => this._backgroundColor;
  set backgroundColorCustom(Color value) {
    this._backgroundColor = value;
    notifyListeners();
  }

  Color get activeColor => this._activeColor;
  set activeColor(Color value) {
    this._activeColor = value;
    notifyListeners();
  }

  Color get inactiveColor => this._inactiveColor;
  set inactiveColor(Color value) {
    this._inactiveColor = value;
    notifyListeners();
  }
}
