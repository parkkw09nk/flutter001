import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(itemBuilder: (context, i) {

        // 홀수면 구분자를 만들고 끝냄
        if (i.isOdd) return const Divider();

        // 홀수에서 리턴되므로 새로운 인덱스를 순차적으로 만들기 위해 2로 나눔.
        final index = i ~/ 2;

        // 데이터가 없으면 그때 그때 10개씩 추가.
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }

        print("index = ${index}");
        // 리스트 타일.... ㅎㅎㅎㅎ
        return ListTile(title: Text(_suggestions[index].asPascalCase, style: _biggerFont));
      })
    );
  }
}
