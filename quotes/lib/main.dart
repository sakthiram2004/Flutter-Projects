import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './quote.dart';

void main() => runApp(MaterialApp(
      home: QuoteList(),
    ));

class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote(
        author: "111",
        text: "It's not what you look at that matters, it's what you see."),
    Quote(
        author: "222",
        text:
            "The best and most beautiful things in the world cannot be seen or even touched - they must be felt with the heart."),
    Quote(
        author: "333",
        text:
            "You don't have to be great to start, but you have to start to be great.")
  ];

  Widget quoteTemplate(quote) {
    return Card(
        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              quote.text,
            ),
            SizedBox(
              height: 6.0,
            ),
            Text(quote.author)
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('Quotes App'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: Column(
          children: quotes.map((quote) => quoteTemplate(quote)).toList(),
        ));
  }
}
