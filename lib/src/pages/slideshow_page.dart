import 'package:flutter/material.dart';

class SlideShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _Slides(),
      ),
    );
  }
}

class _Slides extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        children: [
          _Slide('assets/slides/1.png'),
          _Slide('assets/slides/2.png'),
          _Slide('assets/slides/3.png')
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  _Slide(this.image);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(15),
      child: Image.asset(image),
    );
  }
}
