import 'package:flutter/material.dart';
import 'package:uiflutter/widgets/background.dart';
import 'package:uiflutter/widgets/botton_navigation.dart';
import 'package:uiflutter/widgets/card_table.dart';
import 'package:uiflutter/widgets/page_title.dart';

class HomeDesingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //Agregar elementos uno, encima de otro.!
        children: [Background(), _HomeBody()],
      ),
      bottomNavigationBar: CustomNavigationBotton(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //SingleChildScrollView si el hijo es mas grande va ha permitir realizar scroll
      child: Column(
        children: [PageTitle(), CardTableCustom()],
      ),
    );
  }
}
