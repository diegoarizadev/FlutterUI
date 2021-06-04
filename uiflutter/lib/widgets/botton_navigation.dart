import 'package:flutter/material.dart';

class CustomNavigationBotton extends StatelessWidget {
  const CustomNavigationBotton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        //showSelectedLabels: false, //Se ocultan los textos.
        showUnselectedLabels: false,
        backgroundColor: Color.fromRGBO(55, 57, 84, 1),
        selectedItemColor: Colors.pink,
        unselectedItemColor: Color.fromRGBO(116, 117, 152, 1),
        currentIndex: 0, //Animación de las opciones al seleccionarlos
        items: [
          //Se deben agregar por lo minimo 2 opciones.
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: 'Calendario'),
          BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart_outline_outlined), label: 'Grafica'),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle_sharp), label: 'Usuarios')
        ]);
  }
}
