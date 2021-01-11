import 'package:flutter/material.dart';
import 'package:intermediate_flutter/src/models/slider_model.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final Color primaryColor;

  Slideshow({
    this.slides = const [],
    this.primaryColor = Colors.pinkAccent,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: Center(
        child: Column(
          children: [
            Expanded(child: _Slides(slides: slides)),
            _Dots(amountOfPoints: slides.length, primaryColor: primaryColor),
          ],
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  _Dots({this.amountOfPoints, this.primaryColor});

  final int amountOfPoints;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
            List.generate(amountOfPoints, (index) => _Dot(index, primaryColor)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  final Color primaryColor;

  _Dot(this.index, this.primaryColor);

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: _isSelected(pageViewIndex) ? 15 : 12,
      height: _isSelected(pageViewIndex) ? 15 : 12,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: _isSelected(pageViewIndex) ? primaryColor : Colors.grey,
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
      print('Current page: ${pageViewController.page}');
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
