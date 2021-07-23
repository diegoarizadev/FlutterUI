import 'package:custompainter/src/pages/animaciones_pages.dart';
import 'package:custompainter/src/pages/emergency_page.dart';
import 'package:custompainter/src/pages/headers_page.dart';
import 'package:custompainter/src/pages/piecharts.dart';
import 'package:custompainter/src/pages/pinterest.dart';
import 'package:custompainter/src/pages/slideshows.dart';
import 'package:custompainter/src/pages/sliver.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageRouters = <RouteCustom>[
  RouteCustom(FontAwesomeIcons.slideshare, 'SlideShow', SlideShowCustomPage()),
  RouteCustom(FontAwesomeIcons.ambulance, 'Emergencia', EmergencyPage()),
  RouteCustom(FontAwesomeIcons.heading, 'Encabezados', HeadersCustom()),
  RouteCustom(
      FontAwesomeIcons.peopleCarry, 'Cuadro Animado', const AnimacionesPages()),
  RouteCustom(
      FontAwesomeIcons.circleNotch, 'Barras de progreso', PieChartsCustom()),
  RouteCustom(FontAwesomeIcons.pinterest, 'Pinterest', PinterestPage()),
  RouteCustom(FontAwesomeIcons.mobile, 'slivers', SliverListPage())
];

class RouteCustom {
  final IconData icon;
  final String title;
  final Widget page;

  RouteCustom(this.icon, this.title, this.page);
}
