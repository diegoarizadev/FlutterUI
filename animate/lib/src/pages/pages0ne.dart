import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Page0ne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            FadeIn(delay: Duration(milliseconds: 200), child: Text('Animate')),
        actions: [
          IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.twitter)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (BuildContext context) => Page0ne()));
              },
              icon: FaIcon(FontAwesomeIcons.napster)),
        ],
      ),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          onPressed: () {},
          child: FaIcon(FontAwesomeIcons.play),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
              delay: Duration(milliseconds: 1500),
              child: Icon(
                Icons.new_releases,
                color: Colors.blue,
                size: 40,
              ),
            ),
            FadeInDown(
              delay: Duration(milliseconds: 200),
              child: Text(
                'Titulo',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            FadeInDown(
              delay: Duration(milliseconds: 800),
              child: Text(
                'Titulo pequeño',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            FadeInRight(
              delay: Duration(milliseconds: 1100),
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
