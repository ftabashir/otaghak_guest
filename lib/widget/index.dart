import 'package:flutter/material.dart';

import '../repository/model/index-response.dart' as models;
import 'box.dart';

class IndexWidget extends StatelessWidget {
  final Future<models.IndexResponse> index;

  IndexWidget({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<models.IndexResponse>(
        future: index,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
                scrollDirection: Axis.vertical,
                children: snapshot.data.data
                    .where((box) => box.rooms != null)
                    .map((box) => BoxWidget(box: box))
                    .toList());
          } else if (snapshot.hasError) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "${snapshot.error}",
                    textAlign: TextAlign.center,
                  )
                ]);
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
