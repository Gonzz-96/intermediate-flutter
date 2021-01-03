import 'package:flutter/material.dart';
import 'package:intermediate_flutter/src/widgets/radial_progress_indicator.dart';

class CircularGraphicsPage extends StatefulWidget {
  @override
  _CircularGraphicsPageState createState() => _CircularGraphicsPageState();
}

class _CircularGraphicsPageState extends State<CircularGraphicsPage> {
  double _percentage = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: _fabAction,
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          child: RadialProgressIndicator(
            percentage: _percentage,
            primaryColor: Colors.purple,
          ),
        ),
      ),
    );
  }

  void _fabAction() => setState(() {
        _percentage += 10;
        if (_percentage > 100) _percentage = 0;
      });
}
