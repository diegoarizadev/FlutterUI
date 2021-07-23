import 'package:custompainter/src/theme/theme.dart';
import 'package:custompainter/src/widgets/slide_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SlideShowCustomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange,
        body: Column(
          children: const [
            Expanded(child: MySlideshow()),
            Expanded(child: MySlideshow()),
          ],
        ));
  }
}

class MySlideshow extends StatelessWidget {
  const MySlideshow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context); //Identifica el tema.

    return SlideShow(
      bulletPrimary: 25,
      bulletSecundary: 12,
      pointsUp: true,
      slidesImages: [
        SvgPicture.asset('assets/svg/s1.svg'),
        SvgPicture.asset('assets/svg/s2.svg'),
        SvgPicture.asset('assets/svg/s3.svg'),
        SvgPicture.asset('assets/svg/s4.svg'),
        SvgPicture.asset('assets/svg/s5.svg'),
        SvgPicture.asset('assets/svg/s6.svg')
      ],
      colorPrimary: (appTheme.Darktheme)
          ? appTheme.CurrentTheme.secondaryHeaderColor
          : Colors.green,
      colorSecundary: Colors.black,
    );
  }
}
