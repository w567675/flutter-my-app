import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  RandomWords({this.title});
  final title;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandmWordsState();
  }
}

class RandmWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 14.0);
  final _saved = new Set<WordPair>();
  Widget build(BuildContext context) {
    return new Theme(
      data: new ThemeData(primaryColor: Colors.red),
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text(this.widget.title),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(
                Icons.list,
                color: Colors.white,
              ),
              onPressed: _pushSaved,
            ),
            new IconButton(
              icon: new Icon(
                Icons.room_service,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pushNamed(context, '/pubg'),
            ),
          ],
        ),
        body: _buildSuggestions(),
      ),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      final tiles = _saved.map((pair) => new ListTile(
              title: new Text(
            pair.asPascalCase,
            style: _biggerFont,
          )));
      final divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Save  Suggestions'),
        ),
        body: ListView(
          children: divided,
        ),
      );
    }));
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (BuildContext context, int i) {
        if (i.isOdd) return new Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index], index);
      },
    );
  }

  Widget _buildRow(WordPair pair, index) {
    final alreadySaved = _saved.contains(pair);
    final isHeadItem = index % 6 == 0;
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: isHeadItem ? Theme.of(context).textTheme.headline : _biggerFont,
      ),
      subtitle: isHeadItem ? null : new Text('this is subtitle of ${pair.asLowerCase}'),
      trailing: isHeadItem
          ? null
          : new Icon(
              alreadySaved ? Icons.favorite : Icons.favorite_border,
              color: alreadySaved ? Colors.red : null,
            ),
      onTap: isHeadItem
          ? null
          : () {
              setState(() {
                if (alreadySaved) {
                  _saved.remove(pair);
                } else {
                  _saved.add(pair);
                }
              });
            },
    );
  }
}
