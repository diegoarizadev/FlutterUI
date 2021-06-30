import 'package:custompainter/src/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideShowPage extends StatefulWidget {
  @override
  _SlideShowPageState createState() => _SlideShowPageState();
}

class _SlideShowPageState extends State<SlideShowPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //Se agrega el provider en el scaffold ya que es el elemento que contiene a tanto los slides como a los puntos.
      create: (_) => new SliderModel(), //instancia unica y global del provider.
      child: Scaffold(
        body: Center(
            child: Column(
          children: [
            Expanded(
              child: _Slides(),
            ),
            _Dots()
          ],
        )),
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController =
      PageController(); //Retornada la información del estado del pageView

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController, //Asigna el controlador
        children: [
          _Slide('assets/svg/s1.svg'),
          _Slide('assets/svg/s2.svg'),
          _Slide('assets/svg/s3.svg'),
        ],
      ),
    );
  }

  @override
  void initState() {
    // Listener para escuchar el cambio de la pantalla.
    super.initState();

    pageViewController.addListener(() {
      print('Pagina Actual : ${pageViewController.page}');
      //Instanciar el provider.
      Provider.of<SliderModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }
}

class _Slide extends StatelessWidget {
  final String svg;

  const _Slide(this.svg);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: SvgPicture.asset(svg),
    );
  }
}

class _Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      //color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_Dot(0), _Dot(1), _Dot(2)],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final pageViewIndex =
        Provider.of<SliderModel>(context).currentPage; //Recupera el index.

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(
        horizontal: 5,
      ),
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
            ? Colors.red
            : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
