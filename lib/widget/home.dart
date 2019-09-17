import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:otaghak_guest/repository/room-repo.dart';
import 'package:otaghak_guest/widget/index.dart';
import 'package:otaghak_guest/widget/placeholder.dart';

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomeWidget> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    IndexWidget(index: fetchIndex()),
    PlaceholderWidget(Colors.cyan),
    PlaceholderWidget(Colors.teal),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.mail),
              title: new Text('Messages'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
