import 'package:flutter/material.dart';

import '../repository/model/index-response.dart' as models;
import 'room.dart';

class BoxWidget extends StatelessWidget {
  final models.Box box;

  const BoxWidget({Key key, this.box}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 17),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: SizedBox(
                  width: 6,
                  height: 24,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(3),
                        bottomLeft: Radius.circular(3)),
                    child: Container(
                      color: Color(0xffeb1b59),
                    ),
                  ),
                ),
              ),
              Text(
                box.categoryName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Expanded(
                child: Text(''),
              ),
              Container(
                margin: EdgeInsets.only(left: 16),
                child: Chip(
                  backgroundColor: Color(0xffcce6e1),
                  label: Text(
                    'مشاهده همه',
                    style: TextStyle(
                        color: Color(0xff01806b),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
              height: 240,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children:
                    box.rooms.map((room) => RoomWidget(room: room)).toList(),
              ))
        ],
      ),
    );
  }
}
