import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:otaghak_guest/const/app-strings.dart';
import 'package:otaghak_guest/repository/room-repo.dart';
import 'package:otaghak_guest/res/app_icons.dart';
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

  final _homeNavKey = GlobalKey<NavigatorState>();
  final _placeholderNavKey1 = GlobalKey<NavigatorState>();
  final _placeholderNavKey2 = GlobalKey<NavigatorState>();

  var _children;

  HomeState() {
    _children = <Widget>[
      Navigator(
        key: _homeNavKey,
        onGenerateRoute: (route) => MaterialPageRoute(
          settings: route,
          builder: (context) => IndexWidget(index: fetchIndex()),
        ),
      ),
      Navigator(
        key: _placeholderNavKey1,
        onGenerateRoute: (route) => MaterialPageRoute(
          settings: route,
          builder: (context) => PlaceholderWidget(Colors.cyan),
        ),
      ),
      Navigator(
        key: _placeholderNavKey2,
        onGenerateRoute: (route) => MaterialPageRoute(
          settings: route,
          builder: (context) => PlaceholderWidget(Colors.teal),
        ),
      ),
    ];
  }

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
        body: IndexedStack(
          index: _currentIndex,
          children: _children,
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(AppIcons.explore),
              title: Text(AppStrings.explore),
            ),
            BottomNavigationBarItem(
              icon: Icon(AppIcons.favorite),
              title: Text(AppStrings.favorites),
            ),
            BottomNavigationBarItem(
              icon: Icon(AppIcons.profile),
              title: Text(AppStrings.profile),
            ),
          ],
        ),
      ),
    );
  }
}
