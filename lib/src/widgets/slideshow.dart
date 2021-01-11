import 'package:flutter/material.dart';
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
      create: (_) => _SlideshowModel(),
      child: SafeArea(
        child: Center(child: Builder(
          builder: (context) {
            Provider.of<_SlideshowModel>(context)
              ..primaryColor = primaryColor
              ..secondaryColor = secondaryColor;
            return Column(
              children: [
                if (dotsAbovePageView)
                  _Dots(
                    amountOfPoints: slides.length,
                  ),
                Expanded(child: _Slides(slides: slides)),
                if (!dotsAbovePageView)
                  _Dots(
                    amountOfPoints: slides.length,
                  ),
              ],
            );
          },
        )),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  _Dots({this.amountOfPoints});

  final int amountOfPoints;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(amountOfPoints, (index) => _Dot(index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  _Dot(
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    final slideshowModel = Provider.of<_SlideshowModel>(context);

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: _isSelected(slideshowModel.currentPage) ? 15 : 12,
      height: _isSelected(slideshowModel.currentPage) ? 15 : 12,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: _isSelected(slideshowModel.currentPage)
            ? slideshowModel.primaryColor
            : slideshowModel.secondaryColor,
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
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
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

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0.0;
  Color _primaryColor = Colors.pinkAccent;
  Color _secondaryColor = Colors.grey;

  double get currentPage => _currentPage;
  Color get primaryColor => _primaryColor;
  Color get secondaryColor => _secondaryColor;

  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  set primaryColor(Color primaryColor) {
    this._primaryColor = primaryColor;
    notifyListeners();
  }

  set secondaryColor(Color secondaryColor) {
    this._secondaryColor = secondaryColor;
    notifyListeners();
  }
}
