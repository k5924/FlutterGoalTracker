import 'package:flutter/material.dart';
import "../export.dart";
import "../../models/export.dart";
import "../../services/export.dart";
import "package:cloud_firestore/cloud_firestore.dart";

class ViewGoal extends StatefulWidget {
  const ViewGoal({Key? key, required this.goal}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final GoalModel goal;


  @override
  State<ViewGoal> createState() => _ViewGoal();
}

class _ViewGoal extends State<ViewGoal> {

  final DatabaseService databaseService = DatabaseService(db: FirebaseFirestore.instance);

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
        title: const Text("View Goal"),
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
          Text("Goal name: ${widget.goal.name}"),
          Text("Amount: £ ${widget.goal.amount}"),
          Text("Duration: ${widget.goal.duration} months"),
          OutlinedButton.icon(
            onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateGoal(oldGoalModel: widget.goal),
                      ),
                    );
            },
            icon: const Icon(Icons.edit_outlined),
            label: const Text("Update goal"),
          ),
          OutlinedButton.icon(
            onPressed: () async {
              await databaseService.deleteGoal(goalModel: widget.goal);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.delete_forever),
            label: const Text("Delete goal"),
          )
        ],
      ),
    );
  }
}

