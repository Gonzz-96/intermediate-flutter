import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
              onPressed: () {},
              icon: FaIcon(
                FontAwesomeIcons.twitter,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 14),
            child: IconButton(
              onPressed: () {},
              icon: FaIcon(
                Icons.navigate_next,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: FaIcon(FontAwesomeIcons.play),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.new_releases,
              color: Colors.blue,
              size: 40,
            ),
            Text('Title',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200)),
            Text('I am a little text',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
            Container(
              width: 220,
              height: 2,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
