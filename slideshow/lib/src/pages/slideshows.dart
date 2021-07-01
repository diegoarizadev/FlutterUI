import 'package:custompainter/src/widgets/slide_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlideShowCustomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SlideShow(
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
        colorPrimary: Colors.green,
        colorSecundary: Colors.black,
      ),
    );
  }
}
