import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Title(),
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
      itemCount: 20,
      itemBuilder: (context, index) => _ListItem(),
    );
  }
}

class _ListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Text(
        'Orange',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      padding: EdgeInsets.all(30),
      alignment: Alignment.centerLeft,
      height: size.height / 7,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
