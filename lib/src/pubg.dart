import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class Pubg extends StatelessWidget {
  Pubg({this.title});
  final title;
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(20.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'PLAYERUNKNOWN’S BATTLEGROUNDS',
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                new Container(
                    child: new Text(
                  'PC Xbox one',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ))
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('41'),
        ],
      ),
    );
    Widget banner = Image.asset(
      'assets/images/a.jpg',
      height: 200.0,
      fit: BoxFit.cover,
    );

    Widget textSection = new Container(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: new Text(
        '''
    This is a phrase that we’ve been hearing a lot lately. Bugs, performance problems, and quality-of-life issues have been limiting PUBG's true potential, and you want it fixed. So we think it's time to do something about it.
    
    "FIX PUBG" is a months-long campaign to deliver the changes and improvements that you've been asking for. We've created a roadmap with specific details about our plans, and we intend to update it as we go, checking things off as we deliver on our promises.
    "FIX PUBG" is a months-long campaign to deliver the changes and improvements that you've been asking for. We've created a roadmap with specific details about our plans, and we intend to update it as we go, checking things off as we deliver on our promises.
        ''',
        softWrap: true,
      ),
      //   child: new Text(
      //     '''
      // 		This is a phrase that we’ve been hearing a lot lately. Bugs, performance problems, and quality-of-life issues have been limiting PUBG's true potential, and you want it fixed. So we think it's time to do something about it.

      // 		"FIX PUBG" is a months-long campaign to deliver the changes and improvements that you've been asking for. We've created a roadmap with specific details about our plans, and we intend to update it as we go, checking things off as we deliver on our promises.
      // 		''',
      //     softWrap: true,
      //   ),
    );
    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButtonColumn(Icons.favorite, 'Favorite', Colors.red),
          _buildButtonColumn(Icons.share, 'share', Colors.blue),
        ],
      ),
    );

    Widget img = new Container(
      padding: new EdgeInsets.all(10.0),
      child: new FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        //image: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1538288996061&di=178754cd8af846720bf614a1b0668b1a&imgtype=0&src=http%3A%2F%2Fimage.uczzd.cn%2F12310466422652833975.jpg%3Fid%3D0%26width%3D264%26height%3D148',
        image: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1538297945697&di=0843ad5bf25cef380960edacfad3091a&imgtype=0&src=http%3A%2F%2Fwww.china9613.cn%2Fupload%2Fimg%2FpNCN1YFOlNSw3hfPpivZYZuxOd1evLcI9ycoAz8MWk0bVpW0f2hregXNeoWQtnetf7KPFweUnsFnU1luyFZuB9V2533Dta9mG9hWTx80%2FSnyttkRz55q3Dv1HBwXrCZu.jpg',
      ),
    );



    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new ListView(
        children: <Widget>[
          banner,
          titleSection,
          textSection,
          img,
        ],
      ),
      bottomNavigationBar: new BottomAppBar(
        child: buttonSection,
      ),
    );
  }

  Column _buildButtonColumn(
    IconData icon,
    String label,
    MaterialColor color,
  ) =>
      new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(
            icon,
            color: color,
          ),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.blueGrey),
            ),
          ),
        ],
      );
}
