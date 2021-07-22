import 'package:animate_do/animate_do.dart';
import 'package:custompainter/src/pages/navigation.dart';
import 'package:custompainter/src/pages/twitter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Page0ne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeIn(
          delay: const Duration(milliseconds: 200),
          child: const Text('Animate'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => TwitterPage(),
                ),
              );
            },
            icon: const FaIcon(FontAwesomeIcons.twitter),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (BuildContext context) => Page0ne(),
                ),
              );
            },
            icon: const FaIcon(FontAwesomeIcons.napster),
          ),
        ],
      ),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => NavigationPage(),
              ),
            );
          },
          child: const FaIcon(FontAwesomeIcons.play),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
              delay: const Duration(milliseconds: 1500),
              child: const Icon(
                Icons.new_releases,
                color: Colors.blue,
                size: 40,
              ),
            ),
            FadeInDown(
              delay: const Duration(milliseconds: 200),
              child: const Text(
                'Titulo',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            FadeInDown(
              delay: const Duration(milliseconds: 800),
              child: const Text(
                'Titulo pequeño',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            FadeInRight(
              delay: const Duration(milliseconds: 1100),
              child: Container(
                width: 220,
                height: 2,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
