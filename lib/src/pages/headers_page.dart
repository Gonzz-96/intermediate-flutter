import 'package:flutter/material.dart';
import 'package:intermediate_flutter/src/widgets/headers.dart';

class HeadersPage extends StatefulWidget {
  @override
  _HeadersPageState createState() => _HeadersPageState();
}

class _HeadersPageState extends State<HeadersPage> {
  int _currentHeaderIndex = 0;
  List<Widget> _headersList = [
    SquaredHeader(),
    CircularBorderHeader(),
    DiagonalHeader(),
    DiamondHeader(),
    PeakHeader(),
    CurveHeader(),
    WaveHeader(),
    WaveGradientHeader(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        child: BottomAppBar(
          child: BottomNavigationBar(
            elevation: 5.0,
            unselectedItemColor: Colors.grey,
            currentIndex: _currentHeaderIndex,
            onTap: _updateIndex,
            selectedItemColor: Color(0xff6D05FA),
            items: [
              BottomNavigationBarItem(
                  label: 'Squared', icon: Icon(Icons.gradient)),
              BottomNavigationBarItem(
                  label: 'Circular', icon: Icon(Icons.gradient)),
              BottomNavigationBarItem(
                  label: 'Diagonal', icon: Icon(Icons.gradient)),
              BottomNavigationBarItem(
                  label: 'Diamond', icon: Icon(Icons.gradient)),
              BottomNavigationBarItem(
                  label: 'Peak',
                  icon: Icon(
                    Icons.gradient,
                  )),
              BottomNavigationBarItem(
                  label: 'Curve', icon: Icon(Icons.gradient)),
              BottomNavigationBarItem(
                  label: 'Wave', icon: Icon(Icons.gradient)),
              BottomNavigationBarItem(
                  label: 'Gradient', icon: Icon(Icons.gradient)),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: _currentHeaderIndex,
        children: _headersList,
      ),
    );
  }

  void _updateIndex(int newIndex) {
    setState(() {
      _currentHeaderIndex = newIndex;
    });
  }
}
