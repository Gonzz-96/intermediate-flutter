import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _MainScroll(),
    );
  }
}

class _MainScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // SliverAppBar(
        //   floating: true,
        //   backgroundColor: Colors.redAccent,
        //   title: Text('Hello, world'),
        // ),
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minHeight: 200,
            maxHeight: 200,
            child: Container(
              alignment: Alignment.centerRight,
              child: _Title(),
              color: Colors.white,
            ),
          ),
        ),
        SliverList(delegate: SliverChildListDelegate([...items]))
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double minHeight;
  final double maxHeight;

  _SliverCustomHeaderDelegate({
    this.child,
    this.minHeight,
    this.maxHeight,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
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
  _ListItem('Orange', Color(0xffF08F66)),
  _ListItem('Family', Color(0xffF2A38A)),
  _ListItem('Subscriptions', Color(0xffF7CDD5)),
  _ListItem('Books', Color(0xffFCEBAF)),
  _ListItem('Orange', Color(0xffF08F66)),
  _ListItem('Family', Color(0xffF2A38A)),
  _ListItem('Subscriptions', Color(0xffF7CDD5)),
  _ListItem('Books', Color(0xffFCEBAF)),
];
