import 'package:flutter/material.dart';
import "../../export.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "../../../models/export.dart";
import "../../../services/export.dart";

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
  double balance = 0.0;

  List<GoalModel> goals = [];

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
                        builder: (context) => CreateGoal(oldGoalModel: GoalModel(
                          name: "",
                          amount: "",
                          duration: "",
                          imageUrl: "",
                        )),
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
          StreamBuilder<QuerySnapshot>(
            stream: databaseService.getGoals(),
            builder: (context, snapshot){
                if (!snapshot.hasData){
                    if (snapshot.connectionState != ConnectionState.done){
                        return const Center(
                          child: CircularProgressIndicator()
                        );
                      } else {
                          return const Center(
                            child: Text("Couldnt load goals")
                          );
                        }
                  } else {
                      final goalsDB = snapshot.data!.docs;
                      goals = <GoalModel>[];
                      for (final item in goalsDB){
                          final goal = GoalModel(
                            name: item["name"] as String,
                            amount: item["amount"] as String,
                            duration: item["duration"] as String,
                            imageUrl: item["imageUrl"] as String,
                          );
                          goals.add(goal);
                          setState(() {
                            balance += double.parse(goal.amount) / double.parse(goal.duration);
                            }
                          );
                        }
                        return Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: goals.length,
                            itemBuilder: (context, index){
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) => ViewGoal(goal: goals[index])
                                      )
                                    );

                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          image: NetworkImage(goals[index].imageUrl),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      child: Text("${goals[index].name} £ ${goals[index].amount} over ${goals[index].duration} months"),
                                    ),
                                );
                              }
                          )
                        );
                    }
              }
          ),
          Text("Transactions go here"),
        ],
      ),
    );
  }
}

