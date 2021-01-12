import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intermediate_flutter/src/widgets/pinterest_menu.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => _MenuModel(),
        child: Stack(
          children: [
            _PinterestGrid(),
            _PositionedMenu(),
          ],
        ),
      ),
    );
  }
}

class _PositionedMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Positioned(
      child: Container(
        width: size.width,
        child: Align(
          child: PinterestMenu(
            isVisible: Provider.of<_MenuModel>(context).isMenuVisible,
          ),
        ),
      ),
      bottom: size.height * 0.05,
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
      final menuModel = Provider.of<_MenuModel>(context, listen: false);
      if (scrollController.offset > MediaQuery.of(context).size.height / 2 &&
          scrollController.offset > _precedentOffset) {
        menuModel.isMenuVisible = false;
      } else {
        menuModel.isMenuVisible = true;
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

class _MenuModel with ChangeNotifier {
  bool _isMenuVisible = true;

  bool get isMenuVisible => _isMenuVisible;

  set isMenuVisible(bool newValue) {
    _isMenuVisible = newValue;
    notifyListeners();
  }
}
