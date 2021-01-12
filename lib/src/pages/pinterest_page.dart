import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intermediate_flutter/src/widgets/pinterest_menu.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          _PinterestGrid(),
          Positioned(
            child: Container(
              width: size.width,
              child: Align(child: PinterestMenu()),
            ),
            bottom: size.height * 0.05,
          ),
        ],
      ),
    );
  }
}

class _PinterestGrid extends StatefulWidget {
  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<_PinterestGrid> {
  final items = List.generate(200, (index) => index);

  final scrollController = ScrollController();
  var _precedentOffset = 0.0;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.offset > _precedentOffset) {
        print('Ocultar menu');
      } else {
        print('Mostrar menu');
      }
      _precedentOffset = scrollController.offset;
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      controller: scrollController,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (context, index) => _PinterestItem(index: index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  _PinterestItem({this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.blue,
      ),
      child: new Center(
        child: new CircleAvatar(
          backgroundColor: Colors.white,
          child: new Text('$index'),
        ),
      ),
    );
  }
}
