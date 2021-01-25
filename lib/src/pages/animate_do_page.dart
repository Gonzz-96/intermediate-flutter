import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intermediate_flutter/src/pages/twitter_page.dart';

class AnimateDoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Animate Do',
        ),
        backgroundColor: Colors.blue,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => TwitterPage()),
                );
              },
              icon: FaIcon(
                FontAwesomeIcons.twitter,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 14),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => AnimateDoPage()),
                );
              },
              icon: FaIcon(
                Icons.navigate_next,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          onPressed: () {},
          child: FaIcon(FontAwesomeIcons.play),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
              delay: Duration(milliseconds: 1100),
              child: Icon(Icons.new_releases, color: Colors.blue, size: 40),
            ),
            FadeInDown(
              delay: Duration(milliseconds: 200),
              child: Text('Title',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200)),
            ),
            FadeInDown(
              delay: Duration(milliseconds: 800),
              child: Text('I am a little text',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 1100),
              child: Container(
                width: 220,
                height: 2,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
