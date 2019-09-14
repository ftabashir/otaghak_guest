import 'package:flutter/material.dart';

import '../repository/model/index-response.dart' as models;

class RoomWidget extends StatelessWidget {
  final models.Room room;

  const RoomWidget({Key key, this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(2),
            child: SizedBox(
              width: 162,
              height: 122,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.network(room.imageUrl),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(room.title),
                Text(room.cityName),
                Row(
                  children: <Widget>[
                    Text('${room.bedrooms} اتاق‌خواب'),
                    Text('${room.personCapacity} نفر'),
                  ],
                ),
                Text('از ${room.basePrice.toInt()} تومان'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
