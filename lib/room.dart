import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:otaghak_guest/repository/model/index-response.dart' as models;

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

class IndexWidget extends StatelessWidget {
  final Future<models.IndexResponse> index;

  IndexWidget({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('fa', 'IR'),
      ],
      locale: Locale('fa', 'IR'),
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Otaghak'),
        ),
        body: Center(
          child: FutureBuilder<models.IndexResponse>(
            future: index,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                    scrollDirection: Axis.vertical,
                    children: snapshot.data.data
                        .where((box) => box.rooms != null)
                        .map((box) => BoxWidget(
                              box: box,
                            ))
                        .toList());
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
