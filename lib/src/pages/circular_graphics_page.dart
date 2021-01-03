import 'package:intermediate_flutter/src/widgets/radial_progress_indicator.dart';
import 'package:flutter/material.dart';

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
          backgroundColor: Colors.pink,
          child: Icon(Icons.refresh),
          onPressed: _fabAction,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                CustomRadialProgress(
                  percentage: _percentage,
                  color: Colors.blue,
                ),
                CustomRadialProgress(
                  percentage: _percentage,
                  color: Colors.yellow,
                )
              ],
            ),
            SizedBox(height: 50),
            Row(
              children: [
                CustomRadialProgress(
                  percentage: _percentage,
                  color: Colors.redAccent,
                ),
                CustomRadialProgress(
                  percentage: _percentage,
                  color: Colors.green,
                ),
              ],
            )
          ],
        ));
  }

  void _fabAction() => setState(() {
        _percentage += 10;
        if (_percentage > 100) _percentage = 0;
      });
}

class CustomRadialProgress extends StatelessWidget {
  const CustomRadialProgress({
    @required this.percentage,
    this.color = Colors.purple,
  });

  final double percentage;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.5;
    return Container(
      height: width,
      width: width,
      child: RadialProgressIndicator(
        percentage: percentage,
        primaryColor: color,
      ),
    );
  }
}
