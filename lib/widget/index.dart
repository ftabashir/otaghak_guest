import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../repository/model/index-response.dart' as models;
import 'box.dart';

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
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'IranSans'),
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
