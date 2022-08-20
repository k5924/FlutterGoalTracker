import 'package:flutter/material.dart';
import "../../export.dart";

class SaveTab extends StatefulWidget {
  const SaveTab({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  State<SaveTab> createState() => _SaveTab();
}

class _SaveTab extends State<SaveTab> {
  int balance = 0;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Total Balance: £ ${balance}"),
              ElevatedButton.icon(
                onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateGoal(),
                      ),
                    );
                },
                icon: Icon(
                  Icons.add,
                  size: 24.0,
                ),
                label: Text("Goal"),
              ),
            ],
          ),
          Text("Goals go here"),
          Text("Transactions go here"),
        ],
      ),
    );
  }
}
