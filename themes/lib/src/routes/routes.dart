import 'package:custompainter/src/pages/animaciones_pages.dart';
import 'package:custompainter/src/pages/emergency_page.dart';
import 'package:custompainter/src/pages/headers_page.dart';
import 'package:custompainter/src/pages/piecharts.dart';
import 'package:custompainter/src/pages/pinterest.dart';
import 'package:custompainter/src/pages/slideshows.dart';
import 'package:custompainter/src/pages/sliver.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageRouter = <_Route>[
  _Route(
      iconData: FontAwesomeIcons.slideshare,
      title: 'SlideShow',
      page: SlideShowCustomPage()),
  _Route(
      iconData: FontAwesomeIcons.ambulance,
      title: 'Emergencia',
      page: EmergencyPage()),
  _Route(
      iconData: FontAwesomeIcons.heading,
      title: 'Encabezados',
      page: HeadersCustom()),
  _Route(
      iconData: FontAwesomeIcons.peopleCarry,
      title: 'Cuadro Animado',
      page: AnimacionesPages()),
  _Route(
      iconData: FontAwesomeIcons.circleNotch,
      title: 'Barras de progreso',
      page: PieChartsCustom()),
  _Route(
      iconData: FontAwesomeIcons.pinterest,
      title: 'Pinterest',
      page: PinterestPage()),
  _Route(
      iconData: FontAwesomeIcons.mobile,
      title: 'slivers',
      page: SliverListPage())
];

class _Route {
  final IconData iconData;
  final String title;
  final Widget page;

  _Route({required this.iconData, required this.title, required this.page});
}
