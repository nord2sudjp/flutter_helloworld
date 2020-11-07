import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp()); /*1*/

class MyApp extends StatelessWidget {/*2*/
  @override
  Widget build(BuildContext context) { /*3*/
    final wordPair = WordPair.random();
    return MaterialApp(  /*4*/
      title: 'Welcome to Flutter',
      home: Scaffold( /*5*/
        appBar: AppBar( /*6*/
          title: Text('Welcome to Flutter'),
        ),
        body: Center( /*7*/
          child: RandomWords(),
        ),
      ),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  @override
  final _suggestions=<WordPair>[];
  final _biggerFont = const TextStyle(fontSize:18.0);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

 /*
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }
*/
  Widget _buildSuggestions() => ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]); /*5*/
        });
  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}
