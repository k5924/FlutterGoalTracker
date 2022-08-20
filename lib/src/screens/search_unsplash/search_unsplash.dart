import 'package:flutter/material.dart';

class SearchUnsplash extends StatefulWidget {
  const SearchUnsplash({Key? key, required this.searchTerm}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String searchTerm;


  @override
  State<SearchUnsplash> createState() => _SearchUnsplash();
}

class _SearchUnsplash extends State<SearchUnsplash> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Unsplash"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(
              Icons.close,
            ),
            iconSize: 24.0,
            color: Colors.grey,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("${widget.searchTerm}"),
          Text("Place Holder for image grid view"),
        ],
      ),
    );
  }
}

