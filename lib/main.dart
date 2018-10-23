import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './im.dart';

void main() {
  //debugPaintSizeEnabled=true;
  runApp(new App());
}

List routesSource = [
  {
    'title': 'PUBG',
    'path': '/pubg',
    'component': (context) => new Pubg(title: '绝地求生')
  },
  {
    'title': 'RandomWrods',
    'path': '/randomWords',
    'component': (context) => new RandomWords(title: 'RandomWords')
  },
];

Map<String, WidgetBuilder> getRoutes() {
  Map<String, WidgetBuilder> routes = new Map();
  for (var i = 0; i < routesSource.length; i++) {
    final temp = routesSource[i];
    routes[temp['path']] = temp['component'];
  }
  return routes;
}

class App extends StatelessWidget {
  @override
  Widget build(context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      home: new Home(),
      routes: getRoutes(),
      theme: new ThemeData(primaryColor: Colors.white),
    );
  }
}

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Home'),
      ),
      body: ListView(
        children: this._menuList(context),
      ),
    );
  }

  _menuList(context) {
    final tiles = routesSource.map((value) => new ListTile(
          title: new Text(value['title']),
          //   onTap: () => Navigator.pushNamed(context, value['path']),
          onTap: () => Navigator.of(context).push(new PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return value['component'](context);
              },
              transitionsBuilder: (
                BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child,
              ) {
                // return new FadeTransition(
                //   opacity: animation,
                //   child: new RotationTransition(
                //     turns: new Tween<double>(begin: 0.5, end: 1.0)
                //         .animate(animation),
                //     child: child,
                //   ),
                // );

                // 添加一个平移动画
                return new SlideTransition(
                  position: new Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: const Offset(0.0, 0.0),
                  ).animate(animation),
                  child: child, // child is the value returned by pageBuilder
                );
              })),
        ));
    return ListTile.divideTiles(context: context, tiles: tiles).toList();
  }
}
