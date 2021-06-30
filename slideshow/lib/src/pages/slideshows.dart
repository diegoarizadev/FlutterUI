import 'package:custompainter/src/widgets/slide_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlideShowCustomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlideShow(
        slidesImages: [
          SvgPicture.asset('assets/svg/s1.svg'),
          SvgPicture.asset('assets/svg/s2.svg'),
          SvgPicture.asset('assets/svg/s3.svg'),
          SvgPicture.asset('assets/svg/s4.svg'),
          SvgPicture.asset('assets/svg/s5.svg'),
          SvgPicture.asset('assets/svg/s6.svg'),
          Text('Hi slides'),
          Container(
            width: 200,
            height: 200,
            color: Colors.green,
          )
        ],
      ),
    );
  }
}
