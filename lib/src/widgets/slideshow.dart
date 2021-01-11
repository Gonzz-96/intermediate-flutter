import 'package:flutter/material.dart';
import 'package:intermediate_flutter/src/models/slider_model.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final Color primaryColor;
  final Color secondaryColor;
  final bool dotsAbovePageView;

  Slideshow({
    this.slides = const [],
    this.primaryColor = Colors.pinkAccent,
    this.secondaryColor = Colors.grey,
    this.dotsAbovePageView = false,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              if (dotsAbovePageView)
                _Dots(
                  amountOfPoints: slides.length,
                  primaryColor: primaryColor,
                  secondaryColor: secondaryColor,
                ),
              Expanded(child: _Slides(slides: slides)),
              if (!dotsAbovePageView)
                _Dots(
                  amountOfPoints: slides.length,
                  primaryColor: primaryColor,
                  secondaryColor: secondaryColor,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  _Dots({
    this.amountOfPoints,
    this.primaryColor,
    this.secondaryColor,
  });

  final int amountOfPoints;
  final Color primaryColor;
  final Color secondaryColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(amountOfPoints,
            (index) => _Dot(index, primaryColor, secondaryColor)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  final Color primaryColor;
  final Color secondaryColor;

  _Dot(
    this.index,
    this.primaryColor,
    this.secondaryColor,
  );

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: _isSelected(pageViewIndex) ? 15 : 12,
      height: _isSelected(pageViewIndex) ? 15 : 12,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: _isSelected(pageViewIndex) ? primaryColor : secondaryColor,
        shape: BoxShape.circle,
      ),
    );
  }

  bool _isSelected(double currentIndex) =>
      (currentIndex >= index - 0.5 && currentIndex < index + 0.5);
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  _Slides({this.slides});

  @override
  _SlidesState createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      Provider.of<SliderModel>(context, listen: false).currentPage =
          pageViewController.page;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((element) => _Slide(element)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  _Slide(this.child);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(15),
      child: child,
    );
  }
}
