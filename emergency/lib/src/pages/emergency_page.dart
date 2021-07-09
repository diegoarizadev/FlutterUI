import 'package:emergency/src/widgets/buttonCustom.dart';
import 'package:emergency/src/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
      new ItemBoton(FontAwesomeIcons.carCrash, 'Accidente de tráfico',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Emergencia médica',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Robo / Acoso',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Premios', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Accidente de tráfico',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Emergencia médica',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Robo / Acoso',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Premios', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Accidente de tráfico',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Emergencia médica',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Robo / Acoso',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Premios', Color(0xff317183),
          Color(0xff46997D)),
    ];

    List<Widget> itemMap = items
        .map((item) => BottonCuston(
              icon: item.icon,
              text: item.texto,
              color0ne: item.color1,
              colorTw0: item.color2,
              onPress: () {
                print('Click : $item');
              },
            ))
        .toList();

    return Scaffold(
        //body: PageHeader(),
        body: Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 180),
          child: ListView(
            physics:
                BouncingScrollPhysics(), //Elimina la animaci´øn o subrayado al final de la pantalla en Android
            children: [
              SizedBox(
                height: 90,
              ),
              ...itemMap //Operador Spread
            ],
          ),
        ),
        _Header(),
      ],
    )
        //BottongotdoTemp(),
        );
  }
}

class BottongotdoTemp extends StatelessWidget {
  const BottongotdoTemp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottonCuston(
      icon: FontAwesomeIcons.carCrash,
      text: 'Accidente de tráfic0',
      color0ne: Color(0xff6989f5),
      colorTw0: Color(0xff906ef5),
      onPress: () {
        print('Click0');
      },
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          icon: FontAwesomeIcons.plusCircle,
          tittle: 'Haz solicitado.',
          subTittle: 'Asistencia Medica.',
          color0ne: Color(0xff526BF6),
          colorTw0: Color(0xff67ACF2),
        ),
        Positioned(
            right: 0,
            top: 45,
            child: RawMaterialButton(
              onPressed: () {},
              shape: CircleBorder(),
              padding: EdgeInsets.all(15.0),
              child: FaIcon(
                FontAwesomeIcons.ellipsisV,
                color: Colors.white,
              ),
            )),
      ],
    );
  }
}

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}
