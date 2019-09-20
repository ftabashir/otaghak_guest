import 'package:flutter/material.dart';

class PlaceholderWidget extends StatelessWidget {
  final Color color;
  final int _myIndex = nChildren++;
  static int nChildren = 0;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Column(
        children: <Widget>[
          Text('$_myIndex'),
          RaisedButton(
            child: const Text('کلیک کن!'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlaceholderWidget(color),
                  ));
            },
          )
        ],
      ),
    );
  }
}
