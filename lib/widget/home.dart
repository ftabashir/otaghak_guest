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
  static const _DEFAULT_INDEX = 0;
  int _currentIndex = _DEFAULT_INDEX;

  final _navKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  var _children;

  HomeState() {
    _children = <Widget>[
      Navigator(
        key: _navKeys[0],
        onGenerateRoute: (route) => MaterialPageRoute(
          settings: route,
          builder: (context) => IndexWidget(index: fetchIndex()),
        ),
      ),
      Navigator(
        key: _navKeys[1],
        onGenerateRoute: (route) => MaterialPageRoute(
          settings: route,
          builder: (context) => PlaceholderWidget(Colors.cyan),
        ),
      ),
      Navigator(
        key: _navKeys[2],
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
      home: WillPopScope(
          child: Scaffold(
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
          onWillPop: () async {
            final navigator = _navKeys[_currentIndex].currentState;
            if (navigator.canPop()) {
              navigator.pop();
              return false;
            }
            if (_currentIndex != _DEFAULT_INDEX) {
              setState(() {
                _currentIndex = _DEFAULT_INDEX;
              });
              return false;
            }
            return true;
          }),
    );
  }
}
