import 'package:flutter/material.dart';

import '../repository/model/index-response.dart' as models;

class RoomWidget extends StatelessWidget {
  final models.Room room;

  const RoomWidget({Key key, this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          child: new Container(
            padding: new EdgeInsets.all(8),
            child: new Column(
              children: <Widget>[
                Text(
                  room.title,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.network(room.imageUrl),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
