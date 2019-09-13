import 'package:flutter/material.dart';

import '../repository/model/index-response.dart' as models;
import 'room.dart';

class BoxWidget extends StatelessWidget {
  final models.Box box;

  const BoxWidget({Key key, this.box}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(box.categoryName),
        SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children:
                  box.rooms.map((room) => RoomWidget(room: room)).toList(),
            ))
      ],
    );
  }
}
