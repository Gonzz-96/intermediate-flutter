import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _StuffList(),
    );
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Text(
            'New',
            style: TextStyle(
              color: Color(0xFF532128),
              fontSize: 50,
            ),
          ),
        ),
        Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                width: 120,
                height: 8,
                decoration: BoxDecoration(color: Color(0xFFF7CDD5)),
              ),
            ),
            Container(
              child: Text(
                'List',
                style: TextStyle(
                  color: Color(0xFFD93A30),
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _StuffList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => items[index],
    );
  }
}

class _ListItem extends StatelessWidget {
  final String title;
  final Color color;

  const _ListItem(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      padding: EdgeInsets.all(30),
      alignment: Alignment.centerLeft,
      height: size.height / 7,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}

final items = [
  _ListItem('Orange', Color(0xffF08F66)),
  _ListItem('Family', Color(0xffF2A38A)),
  _ListItem('Subscriptions', Color(0xffF7CDD5)),
  _ListItem('Books', Color(0xffFCEBAF)),
  _ListItem('Orange', Color(0xffF08F66)),
  _ListItem('Family', Color(0xffF2A38A)),
  _ListItem('Subscriptions', Color(0xffF7CDD5)),
  _ListItem('Books', Color(0xffFCEBAF)),
];
