import 'package:custompainter/src/models/slider_model.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideShow extends StatelessWidget {
  final List<Widget> slidesImages;
  final bool pointsUp;
  final Color colorPrimary;
  final Color colorSecundary;

  const SlideShow(
      {required this.slidesImages,
      this.pointsUp =
          false, //Se inicializa en false, para finar los puntos en la parte inferior de la pantalla
      this.colorPrimary = Colors.red,
      this.colorSecundary = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SlideShowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            //Contruye primero el ChangeNotifierProvider y luego construye lo que este dentro de la función.
            builder: (BuildContext context) {
              Provider.of<SlideShowModel>(context).colorPrimary =
                  this.colorPrimary;
              Provider.of<SlideShowModel>(context).colorSecundary =
                  this.colorSecundary;
              return createEstructureSlideShow(
                  pointsUp: pointsUp, slidesImages: slidesImages);
            },
          ),
        ),
      ),
    );
  }
}

class createEstructureSlideShow extends StatelessWidget {
  const createEstructureSlideShow({
    Key? key,
    required this.pointsUp,
    required this.slidesImages,
  }) : super(key: key);

  final bool pointsUp;
  final List<Widget> slidesImages;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (this.pointsUp) _Dots(this.slidesImages.length),
        Expanded(
          child: _Slides(this.slidesImages),
        ),
        if (!this.pointsUp)
          _Dots(
            this.slidesImages.length,
          ),
      ],
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slidesImages;

  _Slides(this.slidesImages);

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

        children: widget.slidesImages.map((slide) => _Slide(slide)).toList(),
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
      Provider.of<SlideShowModel>(context, listen: false).currentPage =
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
  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlide;

  _Dots(this.totalSlide); //Constructor

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      //color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(this.totalSlide,
            (index) => _Dot(index)), //Generated, gerena una lista.
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final slideShowModel = Provider.of<SlideShowModel>(context);

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(
        horizontal: 5,
      ),
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: (slideShowModel.currentPage >= index - 0.5 &&
                slideShowModel.currentPage < index + 0.5)
            ? slideShowModel.colorPrimary
            : slideShowModel.colorSecundary,
        shape: BoxShape.circle,
      ),
    );
  }
}
