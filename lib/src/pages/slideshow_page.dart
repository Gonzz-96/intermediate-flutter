import 'package:flutter/material.dart';
import 'package:intermediate_flutter/src/widgets/slideshow.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Slideshow(
        slides: [
          Image.asset('assets/slides/1.png'),
          Image.asset('assets/slides/2.png'),
          Image.asset('assets/slides/3.png'),
          Image.asset('assets/slides/4.png'),
          Image.asset('assets/slides/5.png'),
        ],
        primaryColor: Colors.pinkAccent,
      ),
    );
  }
}
